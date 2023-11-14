#ifndef LINES_H
#define LINES_H

#include <QQuickPaintedItem>

class Lines : public QQuickPaintedItem
{
public:
    Lines(QQuickItem *parent = 0);

    // QQuickPaintedItem interface
public:
    void paint(QPainter *painter);
};

#endif // LINES_H
