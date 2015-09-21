import XMonad
import Data.Monoid
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Util.Run (safeSpawn)
import Graphics.X11.ExtraTypes.XF86  
import XMonad.Actions.GridSelect
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed
import XMonad.Layout.Tabbed 
import XMonad.Layout.ToggleLayouts

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
myBar = "xmobar"
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)


myConfig = defaultConfig 
	{ terminal           = myTerminal
	, modMask            = myModMask
	, borderWidth        = myBorderWidth
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , workspaces         = myWorkspaces
--    , keys              = myKeys
--    , layoutHook        = myLayout
--    , manageHook        = myManageHook
--    , handleEventHook   = myEventHook
--    , logHook           = myLogHook
--    , startupHook       = myStartupHook
	}

myBorderWidth   = 2
myFocusedBorderColor    = "#222200"
myNormalBorderColor     = "#000000"
myModMask       = mod4Mask
myTerminal      = "xterm"
-- myWorkspaces = [ "Web", "Evernote", "Drafting", "Shell", "Mail", "Music", "IRC", "News", "Transmission", "Misc."]
myWorkspaces = [ "1", "2", "3", "4", "5", "6", "7", "8", "9"]

--myStartupHook :: X ()
--myStartupHook = do
  -- spawnOn "Web" "firefox"
  -- spawnOn "Drafting" "xterm"
  -- spawnOn "Shell" "xterm"
  -- spawnOn "Mail" "vimpc"
  -- spawnOn "Music" "mutt"

-- toggle the status bar gap
--[
--((modMask,      xK_f    ), sendMessage ToggleStruts)
--((modMask,        xK_semicolon), windows W.shiftMaster)
--]
