.class public final Lorg/jboss/netty/util/internal/NativeLibraryLoader;
.super Ljava/lang/Object;
.source "NativeLibraryLoader.java"


# static fields
.field private static final NATIVE_RESOURCE_HOME:Ljava/lang/String; = "META-INF/native/"

.field private static final OSNAME:Ljava/lang/String;

.field private static final WORKDIR:Ljava/io/File;

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 36
    const-class v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;

    invoke-static {v2}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v2

    sput-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 43
    const-string v2, "os.name"

    const-string v3, ""

    invoke-static {v2, v3}, Lorg/jboss/netty/util/internal/SystemPropertyUtil;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "[^a-z0-9]+"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->OSNAME:Ljava/lang/String;

    .line 45
    const-string v2, "io.netty.native.workdir"

    invoke-static {v2}, Lorg/jboss/netty/util/internal/SystemPropertyUtil;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 46
    .local v1, "workdir":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 47
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 48
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 51
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 55
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 60
    :goto_0
    sput-object v0, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->WORKDIR:Ljava/io/File;

    .line 61
    sget-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "-Dio.netty.netty.workdir: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->WORKDIR:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 66
    .end local v0    # "f":Ljava/io/File;
    :goto_1
    return-void

    .line 63
    :cond_1
    invoke-static {}, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->tmpdir()Ljava/io/File;

    move-result-object v2

    sput-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->WORKDIR:Ljava/io/File;

    .line 64
    sget-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "-Dio.netty.netty.workdir: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->WORKDIR:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " (io.netty.tmpdir)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    goto :goto_1

    .line 56
    .restart local v0    # "f":Ljava/io/File;
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 234
    return-void
.end method

.method private static isOSX()Z
    .locals 2

    .prologue
    .line 154
    sget-object v0, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->OSNAME:Ljava/lang/String;

    const-string v1, "macosx"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->OSNAME:Ljava/lang/String;

    const-string v1, "osx"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isWindows()Z
    .locals 2

    .prologue
    .line 150
    sget-object v0, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->OSNAME:Ljava/lang/String;

    const-string v1, "windows"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static load(Ljava/lang/String;Ljava/lang/ClassLoader;)V
    .locals 19
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "loader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 161
    invoke-static/range {p0 .. p0}, Ljava/lang/System;->mapLibraryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 162
    .local v7, "libname":Ljava/lang/String;
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "META-INF/native/"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 164
    .local v11, "path":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v15

    .line 165
    .local v15, "url":Ljava/net/URL;
    if-nez v15, :cond_0

    invoke-static {}, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->isOSX()Z

    move-result v16

    if-eqz v16, :cond_0

    .line 166
    const-string v16, ".jnilib"

    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_2

    .line 167
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "META-INF/native/lib"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ".dynlib"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v15

    .line 173
    :cond_0
    :goto_0
    if-nez v15, :cond_3

    .line 175
    invoke-static/range {p0 .. p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 230
    :cond_1
    :goto_1
    return-void

    .line 169
    :cond_2
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "META-INF/native/lib"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ".jnilib"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v15

    goto :goto_0

    .line 179
    :cond_3
    const/16 v16, 0x2e

    move/from16 v0, v16

    invoke-virtual {v7, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    .line 180
    .local v5, "index":I
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v7, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 181
    .local v12, "prefix":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v7, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    .line 182
    .local v13, "suffix":Ljava/lang/String;
    const/4 v4, 0x0

    .line 183
    .local v4, "in":Ljava/io/InputStream;
    const/4 v9, 0x0

    .line 184
    .local v9, "out":Ljava/io/OutputStream;
    const/4 v14, 0x0

    .line 185
    .local v14, "tmpFile":Ljava/io/File;
    const/4 v8, 0x0

    .line 187
    .local v8, "loaded":Z
    :try_start_0
    sget-object v16, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->WORKDIR:Ljava/io/File;

    move-object/from16 v0, v16

    invoke-static {v12, v13, v0}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v14

    .line 188
    invoke-virtual {v15}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v4

    .line 189
    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    .end local v9    # "out":Ljava/io/OutputStream;
    .local v10, "out":Ljava/io/OutputStream;
    const/16 v16, 0x2000

    :try_start_1
    move/from16 v0, v16

    new-array v2, v0, [B

    .line 193
    .local v2, "buffer":[B
    :goto_2
    invoke-virtual {v4, v2}, Ljava/io/InputStream;->read([B)I

    move-result v6

    .local v6, "length":I
    if-lez v6, :cond_7

    .line 194
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v10, v2, v0, v6}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    .line 202
    .end local v2    # "buffer":[B
    .end local v6    # "length":I
    :catch_0
    move-exception v3

    move-object v9, v10

    .line 203
    .end local v10    # "out":Ljava/io/OutputStream;
    .local v3, "e":Ljava/lang/Exception;
    .restart local v9    # "out":Ljava/io/OutputStream;
    :goto_3
    :try_start_2
    new-instance v16, Ljava/lang/UnsatisfiedLinkError;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "could not load a native library: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/UnsatisfiedLinkError;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Ljava/lang/UnsatisfiedLinkError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v16

    check-cast v16, Ljava/lang/UnsatisfiedLinkError;

    throw v16
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 206
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v16

    :goto_4
    if-eqz v4, :cond_4

    .line 208
    :try_start_3
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 213
    :cond_4
    :goto_5
    if-eqz v9, :cond_5

    .line 215
    :try_start_4
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 220
    :cond_5
    :goto_6
    if-eqz v14, :cond_6

    .line 221
    if-eqz v8, :cond_a

    .line 222
    invoke-virtual {v14}, Ljava/io/File;->deleteOnExit()V

    .line 206
    :cond_6
    :goto_7
    throw v16

    .line 196
    .end local v9    # "out":Ljava/io/OutputStream;
    .restart local v2    # "buffer":[B
    .restart local v6    # "length":I
    .restart local v10    # "out":Ljava/io/OutputStream;
    :cond_7
    :try_start_5
    invoke-virtual {v10}, Ljava/io/OutputStream;->flush()V

    .line 197
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 198
    const/4 v9, 0x0

    .line 200
    .end local v10    # "out":Ljava/io/OutputStream;
    .restart local v9    # "out":Ljava/io/OutputStream;
    :try_start_6
    invoke-virtual {v14}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Ljava/lang/System;->load(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 201
    const/4 v8, 0x1

    .line 206
    if-eqz v4, :cond_8

    .line 208
    :try_start_7
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 213
    :cond_8
    :goto_8
    if-eqz v9, :cond_9

    .line 215
    :try_start_8
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 220
    :cond_9
    :goto_9
    if-eqz v14, :cond_1

    .line 221
    if-eqz v8, :cond_b

    .line 222
    invoke-virtual {v14}, Ljava/io/File;->deleteOnExit()V

    goto/16 :goto_1

    .line 209
    .end local v2    # "buffer":[B
    .end local v6    # "length":I
    :catch_1
    move-exception v17

    goto :goto_5

    .line 216
    :catch_2
    move-exception v17

    goto :goto_6

    .line 224
    :cond_a
    invoke-virtual {v14}, Ljava/io/File;->delete()Z

    move-result v17

    if-nez v17, :cond_6

    .line 225
    invoke-virtual {v14}, Ljava/io/File;->deleteOnExit()V

    goto :goto_7

    .line 209
    .restart local v2    # "buffer":[B
    .restart local v6    # "length":I
    :catch_3
    move-exception v16

    goto :goto_8

    .line 216
    :catch_4
    move-exception v16

    goto :goto_9

    .line 224
    :cond_b
    invoke-virtual {v14}, Ljava/io/File;->delete()Z

    move-result v16

    if-nez v16, :cond_1

    .line 225
    invoke-virtual {v14}, Ljava/io/File;->deleteOnExit()V

    goto/16 :goto_1

    .line 206
    .end local v2    # "buffer":[B
    .end local v6    # "length":I
    .end local v9    # "out":Ljava/io/OutputStream;
    .restart local v10    # "out":Ljava/io/OutputStream;
    :catchall_1
    move-exception v16

    move-object v9, v10

    .end local v10    # "out":Ljava/io/OutputStream;
    .restart local v9    # "out":Ljava/io/OutputStream;
    goto :goto_4

    .line 202
    :catch_5
    move-exception v3

    goto :goto_3
.end method

.method private static tmpdir()Ljava/io/File;
    .locals 5

    .prologue
    .line 71
    :try_start_0
    const-string v2, "io.netty.tmpdir"

    invoke-static {v2}, Lorg/jboss/netty/util/internal/SystemPropertyUtil;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->toDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 72
    .local v0, "f":Ljava/io/File;
    if-eqz v0, :cond_0

    .line 73
    sget-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "-Dio.netty.tmpdir: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 124
    :goto_0
    return-object v0

    .line 77
    :cond_0
    const-string v2, "java.io.tmpdir"

    invoke-static {v2}, Lorg/jboss/netty/util/internal/SystemPropertyUtil;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->toDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 78
    if-eqz v0, :cond_2

    .line 79
    sget-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "-Dio.netty.tmpdir: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " (java.io.tmpdir)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 112
    :catch_0
    move-exception v2

    .line 117
    :cond_1
    invoke-static {}, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->isWindows()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 118
    new-instance v0, Ljava/io/File;

    .end local v0    # "f":Ljava/io/File;
    const-string v2, "C:\\Windows\\Temp"

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 123
    .restart local v0    # "f":Ljava/io/File;
    :goto_1
    sget-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to get the temporary directory; falling back to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;)V

    goto :goto_0

    .line 84
    :cond_2
    :try_start_1
    invoke-static {}, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->isWindows()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 85
    const-string v2, "TEMP"

    invoke-static {v2}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->toDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 86
    if-eqz v0, :cond_3

    .line 87
    sget-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "-Dio.netty.tmpdir: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " (%TEMP%)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 91
    :cond_3
    const-string v2, "USERPROFILE"

    invoke-static {v2}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 92
    .local v1, "userprofile":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\\AppData\\Local\\Temp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->toDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    sget-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "-Dio.netty.tmpdir: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " (%USERPROFILE%\\AppData\\Local\\Temp)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 99
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\\Local Settings\\Temp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->toDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 100
    if-eqz v0, :cond_1

    .line 101
    sget-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "-Dio.netty.tmpdir: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " (%USERPROFILE%\\Local Settings\\Temp)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 106
    .end local v1    # "userprofile":Ljava/lang/String;
    :cond_5
    const-string v2, "TMPDIR"

    invoke-static {v2}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->toDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 107
    if-eqz v0, :cond_1

    .line 108
    sget-object v2, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "-Dio.netty.tmpdir: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ($TMPDIR)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 120
    :cond_6
    new-instance v0, Ljava/io/File;

    .end local v0    # "f":Ljava/io/File;
    const-string v2, "/tmp"

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v0    # "f":Ljava/io/File;
    goto/16 :goto_1
.end method

.method private static toDirectory(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 129
    if-nez p0, :cond_0

    move-object v0, v2

    .line 145
    :goto_0
    return-object v0

    .line 133
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 134
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 135
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 138
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_2

    move-object v0, v2

    .line 139
    goto :goto_0

    .line 143
    :cond_2
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 144
    :catch_0
    move-exception v1

    .line 145
    .local v1, "ignored":Ljava/lang/Exception;
    goto :goto_0
.end method
