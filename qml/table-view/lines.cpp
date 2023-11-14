#include "lines.h"

#include <QPainter>

Lines::Lines(QQuickItem* parent) : QQuickPaintedItem(parent)
{

}

void Lines::paint(QPainter *painter)
{
    for (int w = 0; w < this->width(); w += 50) {
        painter->drawLine(QPoint(w, 0), QPoint(w, this->height()));
    }
    qDebug() << this->height();
    for (int h = 0; h < this->height(); h += 50) {
        painter->drawLine(QPoint(0, h), QPoint(this->width(), h));
    }

//    QQuickPaintedItem::paint(painter);
}
