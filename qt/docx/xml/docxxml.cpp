#include "docxxml.h"

#include <QDebug>
#include <QXmlStreamReader>

QString DocxXml::parseBackquotes(QString backquotes)
{
    return backquotes.remove(' ').remove('`').remove('{').remove('}');
}

QString DocxXml::handleXmlDocument(QString data)
{
    QXmlStreamReader xml(data);
    QVector<Tag> tags;

    ReplacingText curRepText;
    QVector<ReplacingText> repTexts;
    bool isNextClose_rTag = false;
    while (!xml.atEnd()) {
        xml.readNext();
        if (xml.isStartElement()) {

            Tag tag;
            tag.name = xml.name().toString();
            tag.startPos = xml.characterOffset() - tag.name.length() - 2; // 2 - <>
            tags.append(tag);

        } else if (xml.isCharacters()) {

            QString text = xml.text().toString();
            if (text.contains('`')) {
                if (curRepText.startPos == -1) {
                    auto it = std::find_if(tags.rbegin(), tags.rend(), [&curRepText](const Tag& tag) { return tag.name == "r"; });
                    curRepText.startPos = (*it).startPos;
                } else {
                    isNextClose_rTag = true;
                }
            }

            if (curRepText.startPos > 0) {
                curRepText.name.append(text);
            }

        } else if (xml.isEndElement()) {

            if (isNextClose_rTag && tags.last().name == "r") {
                isNextClose_rTag = false;
                curRepText.endPos = xml.characterOffset();
                curRepText.name = parseBackquotes(curRepText.name);
                repTexts.append(curRepText);
//                qDebug() << "text" << curRepText.name;
                curRepText = ReplacingText();
            }

            if (tags.last().name == xml.name()) {
                tags.last().endPos = xml.characterOffset(); // ненужная операция, для примера
                tags.removeLast();
            }

        }
    }

    std::for_each(repTexts.rbegin(), repTexts.rend(), [&data] (ReplacingText repText){
        QString text = QString("<r><t>%1</t></r>");
        if (repText.name == "word") {
            text = text.arg("русское слово");
        }
        data = !text.isEmpty() ? data.replace(repText.startPos, repText.endPos - repText.startPos, text) : data;
    });
//    qDebug() << "len:" << tags.length();

    return data;
}
