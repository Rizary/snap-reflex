import Distribution.MacOSX
import Distribution.Simple

main :: IO ()
main = defaultMainWithHooks $ simpleUserHooks {
          postBuild = appBundleBuildHook guiApps
       }

guiApps :: [MacApp]
guiApps = [
    MacApp "frontend"
      Nothing
      (Just "macos/Info.plist")
      []
      []
      DoNotChase
   ]
