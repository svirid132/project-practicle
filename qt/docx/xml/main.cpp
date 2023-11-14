#include <QCoreApplication>
#include <QDebug>
#include <QXmlStreamReader>

struct Tag {
    QString name;
    int startPos = -1;
    int endPos = -1;
};

struct ReplacingText {
    QString name; // имя, которое указывает, что изменить
    // позиция замены текста
    int startPos = -1;
    int endPos = -1;
};

QString parseBackquotes(QString backquotes) {
    return backquotes.remove(' ').remove('`').remove('{').remove('}');
}

QString handleXmlDocument(QString data);

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QString data = "<tag><a><one/>"
                   "<r><t> `{</t></r>"
                   "<r><t> word </t></r>"
                   "<r><t>}` </t></r>"
                   "<r><t>`{</t></r>"
                   "<r><t> qwerty </t></r>"
                   "<r><t>}`</t></r>"
                   "</a></tag>";

    qDebug() << handleXmlDocument(data);

    return a.exec();
}

QString handleXmlDocument(QString data) {
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
                qDebug() << "text" << curRepText.name;
                curRepText = ReplacingText();
            }

            if (tags.last().name == xml.name()) {
                tags.last().endPos = xml.characterOffset();
                tags.removeLast();
            }

        }
    }

    std::for_each(repTexts.rbegin(), repTexts.rend(), [&data] (ReplacingText repText){
        QString text = QString("<r><t>%1</t></r>").arg(repText.name);
        data = data.replace(repText.startPos, repText.endPos - repText.startPos, text);
    });
    qDebug() << "len:" << tags.length();

    return data;
}
