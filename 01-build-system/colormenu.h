/*********************************************************************************
NixNote - An open-source client for the Evernote service.
Copyright (C) 2013 Randy Baumgarte

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
***********************************************************************************/

#ifndef COLORMENU_H
#define COLORMENU_H

#include <QObject>
#include <QColor>
#include <QMenu>
#include <QMap>

class ColorMenu : public QObject
{
    Q_OBJECT
private:
    QMenu menu;
    QObject *parent;
    void populateList();
    QColor currentColor;
    QMap<QString, QString> colorMap;

    static QStringList colorNames();

public:
    explicit ColorMenu(QObject *parent = 0);
    void setCurrentColor(QColor color);
    void setCurrentColor(QString color);
    QColor* getCurrentColor();
    QString getCurrentColorName();
    QMenu* getMenu();

signals:
    
public slots:
    void itemHovered();
    
};

#endif // COLORMENU_H
