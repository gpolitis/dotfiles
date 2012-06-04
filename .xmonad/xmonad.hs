import XMonad
import XMonad.Util.EZConfig
import XMonad.Config.Gnome
import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import XMonad.Config.Azerty
import qualified Data.Map as M
import XMonad.Hooks.DynamicLog
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Window
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.CopyWindow(copy)
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.SetWMName

myConfig = azertyConfig { modMask = mod4Mask
                     , layoutHook = myLayoutHook
                     , workspaces = [ "_|_", "2:email", "3:im" ]
                     , terminal = "~/bin/x-terminal-emulator.sh"
                     , startupHook = setWMName "LG3D"
                     } `additionalKeysP` myKeys

myXPConfig = defaultXPConfig

myManageHook = composeAll
    [ className =? "emulator-arm" --> doFloat
    , manageDocks
    ]

myKeys = [ ("M-p", shellPrompt defaultXPConfig)
           
           -- sublayouts
         , ("M-C-h", sendMessage $ pullGroup L)
         , ("M-C-l", sendMessage $ pullGroup R)
         , ("M-C-k", sendMessage $ pullGroup U)
         , ("M-C-j", sendMessage $ pullGroup D)
         , ("M-C-m", withFocused (sendMessage . MergeAll))
         , ("M-C-u", withFocused (sendMessage . UnMerge))
           
           -- dynamic workspaces
         , ("M-S-<Backspace>", removeWorkspace)
         , ("M-S-r", renameWorkspace myXPConfig)
         , ("M-m", withWorkspace myXPConfig (windows . W.shift))
         , ("M-S-m", withWorkspace myXPConfig (windows . copy))
         , ("M-S-v", selectWorkspace myXPConfig)
         , ("M-S-g", windowPromptGoto myXPConfig)
         , ("M-S-b", windowPromptBring myXPConfig)
         , ("M-S-l", spawn "xscreensaver-command -lock")
         ]

myLayoutHook = avoidStruts $ windowNavigation $ subTabbed $
               (tall ||| threeCol ||| Full)
    where
      tall     = Tall nmaster delta ratio
      threeCol = ThreeCol nmaster delta ratio
      nmaster  = 1
      delta    = 3/100
      ratio    = 1/2

main = xmonad =<< xmobar (withUrgencyHook NoUrgencyHook $ myConfig)
