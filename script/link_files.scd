"SC_EXTENSIONS_PATH".setenv(Platform.userExtensionDir);
"SC_NRT_EXTENSIONS_PATH".setenv(Platform.userExtensionDir ++ "/nrt");
"SC_NRT_LIB_PATH".setenv("../lib".resolveRelative);
"./link_lib_files.sh".resolveRelative.unixCmdGetStdOut;
