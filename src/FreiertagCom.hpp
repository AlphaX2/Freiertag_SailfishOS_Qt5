#ifndef FREIERTAG_HPP_
#define FREIERTAG_HPP_

#include <QObject>
#include <QString>
#include <QDebug>

#include "FreiListModel.hpp"

class FreiertagCom : public QObject {
Q_OBJECT

public:
    FreiertagCom(FreiListModel *model);
    Q_INVOKABLE bool suche(QString bland, QString jahr, QString typ);
    ~FreiertagCom();

private:
    bool parser(const QString &path, const QString &bland);

private:
    FreiListModel *m_model;
};
#endif /* FREIERTAG_HPP_ */
