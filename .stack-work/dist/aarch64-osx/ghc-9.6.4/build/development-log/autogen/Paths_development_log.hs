{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_development_log (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/polaris/Projects/haskell/development-log/.stack-work/install/aarch64-osx/9fdd1c3ec3a15e750f2b0e7cf5e49732012d47e22656fd34bdcb67508db4bd34/9.6.4/bin"
libdir     = "/Users/polaris/Projects/haskell/development-log/.stack-work/install/aarch64-osx/9fdd1c3ec3a15e750f2b0e7cf5e49732012d47e22656fd34bdcb67508db4bd34/9.6.4/lib/aarch64-osx-ghc-9.6.4/development-log-0.1.0.0-GWKJCTAlMkJ9MK2oBRmtls-development-log"
dynlibdir  = "/Users/polaris/Projects/haskell/development-log/.stack-work/install/aarch64-osx/9fdd1c3ec3a15e750f2b0e7cf5e49732012d47e22656fd34bdcb67508db4bd34/9.6.4/lib/aarch64-osx-ghc-9.6.4"
datadir    = "/Users/polaris/Projects/haskell/development-log/.stack-work/install/aarch64-osx/9fdd1c3ec3a15e750f2b0e7cf5e49732012d47e22656fd34bdcb67508db4bd34/9.6.4/share/aarch64-osx-ghc-9.6.4/development-log-0.1.0.0"
libexecdir = "/Users/polaris/Projects/haskell/development-log/.stack-work/install/aarch64-osx/9fdd1c3ec3a15e750f2b0e7cf5e49732012d47e22656fd34bdcb67508db4bd34/9.6.4/libexec/aarch64-osx-ghc-9.6.4/development-log-0.1.0.0"
sysconfdir = "/Users/polaris/Projects/haskell/development-log/.stack-work/install/aarch64-osx/9fdd1c3ec3a15e750f2b0e7cf5e49732012d47e22656fd34bdcb67508db4bd34/9.6.4/etc"

getBinDir     = catchIO (getEnv "development_log_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "development_log_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "development_log_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "development_log_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "development_log_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "development_log_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
