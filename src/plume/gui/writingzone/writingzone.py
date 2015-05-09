from PyQt5.QtWidgets import QWidget,  QTextEdit, QGridLayout, QMenu, QApplication
from ..common import DataAndCoreSetter


class WritingZone(QWidget):
    
    def __init__(self, parent=None, core=None):
        super(QWidget, self).__init__(parent=parent)
        
        core = core
        
        self.rich_text_edit = RichTextEdit(self)
        grid_layout = QGridLayout()
        grid_layout.addWidget(self.rich_text_edit)
        self.setLayout(grid_layout)
        


class RichTextEdit(QTextEdit):
    
    def __init__(self, parent=None):
        super(QTextEdit, self).__init__(parent=parent)
        
    def contextMenuEvent(self, event):
#        self.popMenu = QtWidgets.QMenu(self)
#        self.popMenu.addAction(QtWidgets.QAction('test0', None))
#        self.popMenu.addAction(QtWidgets.QAction('test1', None))
#        self.popMenu.addSeparator()
#        self.popMenu.addAction(QtWidgets.QAction('test2', None))
#        self.popMenu.exec_(event.globalPos())

        menu = QMenu(self)
        quitAction = menu.addAction(_("Quit"))
        action = menu.exec_(self.mapToGlobal(event.pos()))
        if action == quitAction:
            QApplication.quit()
