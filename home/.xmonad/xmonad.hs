import XMonad
import Data.Monoid
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Util.EZConfig
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
import XMonad.Layout.MultiToggle
import XMonad.Layout.NoBorders
import XMonad.Layout.Reflect
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing
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
    , layoutHook        = myLayout
--    , manageHook        = myManageHook
--    , handleEventHook   = myEventHook
--    , logHook           = myLogHook
    , startupHook       = myStartupHook
}

myBorderWidth   = 4
myFocusedBorderColor    = "#dc322f"
-- myFocusedBorderColor    = "#005f00"
-- myFocusedBorderColor    = "#ff0000"
-- myFocusedBorderColor    = "#222200"
myNormalBorderColor     = "#000000"
myModMask       = mod4Mask
myTerminal      = "xterm"
-- myWorkspaces = [ "Web", "Evernote", "Drafting", "Shell", "Mail", "Music", "IRC", "News", "Transmission", "Misc."]
myWorkspaces = [ "1", "2", "3", "4", "5", "6", "7", "8", "9"]
myLayout = tiled ||| tiledR ||| Mirror tiled ||| Full
--myLayout = mkToggle (single REFLECTX) $
--           mkToggle (single REFLECTY) $
--               (tiled ||| tiledR ||| Mirror tiled ||| Full)
                  where  
                       -- default tiling algorithm partitions the screen into two panes  
                       tiled = spacing 0 $ Tall nmaster delta ratio  
                    
                       -- reflected default tiling algorithm partitions the screen into two panes  
                       tiledR = spacing 0 $ reflectHoriz $ Tall nmaster delta ratio  
                    
                       -- The default number of windows in the master pane  
                       nmaster = 1  
                    
                       -- Default proportion of screen occupied by master pane  
                       ratio = 1/2  
                    
                       -- Percent of screen to increment by when resizing panes  
                       delta = 5/100

--myKeys = [ ((myModMask .|. controlMask, xK_x), sendMessage $ Toggle REFLECTX)
--         , ((myModMask .|. controlMask, xK_y), sendMessage $ Toggle REFLECTY)
--         ]
--      mkToggle (single REFLECTX) $
--      mkToggle (single REFLECTY) $
--        (tiled ||| tiledR ||| Mirror tiled ||| Full  )
--
--      , ((modm .|. controlMask, xK_x), sendMessage $ Toggle REFLECTX)
--      , ((modm .|. controlMask, xK_y), sendMessage $ Toggle REFLECTY)


-- myStartupHook = ewmhDesktopsStartup
myStartupHook :: X ()
myStartupHook = do
  ewmhDesktopsStartup
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
