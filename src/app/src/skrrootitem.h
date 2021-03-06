/***************************************************************************
*   Copyright (C) 2020 by Cyril Jacquet                                 *
*   cyril.jacquet@skribisto.eu                                        *
*                                                                         *
*  Filename: SKRRootItem.h                                                   *
*  This file is part of Skribisto.                                    *
*                                                                         *
*  Skribisto is free software: you can redistribute it and/or modify  *
*  it under the terms of the GNU General Public License as published by   *
*  the Free Software Foundation, either version 3 of the License, or      *
*  (at your option) any later version.                                    *
*                                                                         *
*  Skribisto is distributed in the hope that it will be useful,       *
*  but WITHOUT ANY WARRANTY; without even the implied warranty of         *
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          *
*  GNU General Public License for more details.                           *
*                                                                         *
*  You should have received a copy of the GNU General Public License      *
*  along with Skribisto.  If not, see <http://www.gnu.org/licenses/>. *
***************************************************************************/

#ifndef SKRROOTITEM_H
#define SKRROOTITEM_H

#include <QObject>
#include <QString>
#include <QTranslator>

class SKRRootItem : public QObject
{

    Q_OBJECT
    Q_PROPERTY(QString currentTranslationLanguageCode READ getLanguageFromSettings WRITE setCurrentTranslationLanguageCode NOTIFY currentTranslationLanguageCodeChanged)
    Q_PROPERTY(QString dynTr READ getEmptyString NOTIFY currentTranslationLanguageCodeChanged)
public:
    explicit SKRRootItem(QObject *parent);
    Q_INVOKABLE void setCurrentTranslationLanguageCode(const QString &langCode = "default");

    Q_INVOKABLE void applyLanguageFromSettings();
    Q_INVOKABLE QString getLanguageFromSettings() const;


    Q_INVOKABLE QString skribistoVersion() const;
    Q_INVOKABLE QString toLocaleDateTimeFormat(const QDateTime &dateTime) const;
signals:
    void currentTranslationLanguageCodeChanged(const QString &langCode);

private:
    QString getEmptyString() {
        return "";
       }

    QString m_langCode;
    QTranslator *skribistoTranslator;
    QTranslator *qtTranslator;


};

#endif // SKRROOTITEM_H
