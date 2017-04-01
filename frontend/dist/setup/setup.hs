{-# LANGUAGE CPP #-}

import Distribution.Simple

#if !defined(ghcjs_HOST_OS) && defined(MIN_VERSION_cabal_macosx)
import Distribution.MacOSX

main :: IO ()
main = defaultMainWithHooks $ simpleUserHooks
#if !defined(ghcjs_HOST_OS) && defined(MIN_VERSION_cabal_macosx)
      {
          postBuild = appBundleBuildHook guiApps,
	  postCopy = appBundleCopyHook guiApps
       }
#endif

guiApps :: [MacApp]
guiApps = [
    MacApp "frontend"
      Nothing
      (Just "macos/Info.plist")
      []
      []
      DoNotChase
   ]
#endif

