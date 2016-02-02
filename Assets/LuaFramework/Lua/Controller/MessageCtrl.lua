
local MessageCtrl = {}
local this = MessageCtrl

local message
local transform
local gameObject

--构建函数--
function MessageCtrl.New()
	logWarn("MessageCtrl.New--->>")
	this.messagePanel = require("View/MessagePanel.lua").New()
	return this
end

function MessageCtrl.Awake()
	logWarn("MessageCtrl.Awake--->>")
	PanelManager:CreatePanel('Message', this.OnCreate)
end

--启动事件--
function MessageCtrl.OnCreate(obj)
	gameObject = obj

	local panel = gameObject:GetComponent('UIPanel')
	panel.depth = 10	--设置纵深--

	message = gameObject:GetComponent('LuaBehaviour')
	message:AddClick(this.messagePanel.btnClose, this.OnClick)

	logWarn("Start lua--->>"..gameObject.name)
end

--单击事件--
function MessageCtrl.OnClick(go)
	destroy(gameObject)
end

--关闭事件--
function MessageCtrl.Close()
	PanelManager:ClosePanel(CtrlName.Message)
end

return MessageCtrl