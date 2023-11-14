#ifndef DOCXXML_H
#define DOCXXML_H

#include <QString>

namespace DocxXml {

// для document.xml
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
QString parseBackquotes(QString backquotes);
QString handleXmlDocument(QString data);
}

#endif // DOCXXML_H
