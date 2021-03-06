import "java.awt.Color"
import "java.awt.BorderLayout"
import "javax.swing.JFrame"
import "javax.swing.JEditorPane"
import "javax.swing.JLabel"
import "javax.swing.JTextArea"
import "javax.swing.JMenuBar"
import "javax.swing.JMenu"
import "javax.swing.JMenuItem"

-- set up frame, get content pane
local frame = JFrame("Sample Luaj");
local menuBar = JMenuBar();
frame.setJMenuBar(menuBar);
local run=JMenuItem("运行")
--menuBar.add(JMenu("打开"))
menuBar.add(run)
local content = frame.getContentPane()
local textArea = JTextArea(20, 60);
local path="demo.lua"
local f,s=io.open(path)
if f then
	local s=f:read("*a")
	f:close()
	textArea.setText(s)
end
function save(s)
	local f=io.open(path,"w")
	if f then
		local s=f:write(s)
		f:close()
	end
end
--editor.setSize(720,480)
-- add the main pane to the main content
content.add(textArea, BorderLayout.CENTER)
run.addActionListener({actionPerformed=function()
	save(textArea.getText())
	dofile(path)
end})
frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE)
frame.pack()
frame.setVisible(true)




