#include "docxxml.h"
#include <QCoreApplication>
#include <QDebug>
#include <QXmlStreamReader>

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

    qDebug() << DocxXml::handleXmlDocument(data);

    return a.exec();
}
