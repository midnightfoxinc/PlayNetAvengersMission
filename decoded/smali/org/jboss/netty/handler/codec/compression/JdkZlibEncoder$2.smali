.class synthetic Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$2;
.super Ljava/lang/Object;
.source "JdkZlibEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$jboss$netty$channel$ChannelState:[I

.field static final synthetic $SwitchMap$org$jboss$netty$handler$codec$compression$ZlibWrapper:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 237
    invoke-static {}, Lorg/jboss/netty/channel/ChannelState;->values()[Lorg/jboss/netty/channel/ChannelState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$2;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    :try_start_0
    sget-object v0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$2;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    sget-object v1, Lorg/jboss/netty/channel/ChannelState;->OPEN:Lorg/jboss/netty/channel/ChannelState;

    invoke-virtual {v1}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_4

    :goto_0
    :try_start_1
    sget-object v0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$2;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    sget-object v1, Lorg/jboss/netty/channel/ChannelState;->CONNECTED:Lorg/jboss/netty/channel/ChannelState;

    invoke-virtual {v1}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_3

    :goto_1
    :try_start_2
    sget-object v0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$2;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    sget-object v1, Lorg/jboss/netty/channel/ChannelState;->BOUND:Lorg/jboss/netty/channel/ChannelState;

    invoke-virtual {v1}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 220
    :goto_2
    invoke-static {}, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->values()[Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$2;->$SwitchMap$org$jboss$netty$handler$codec$compression$ZlibWrapper:[I

    :try_start_3
    sget-object v0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$2;->$SwitchMap$org$jboss$netty$handler$codec$compression$ZlibWrapper:[I

    sget-object v1, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->GZIP:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_1

    :goto_3
    :try_start_4
    sget-object v0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$2;->$SwitchMap$org$jboss$netty$handler$codec$compression$ZlibWrapper:[I

    sget-object v1, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_0

    :goto_4
    return-void

    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    goto :goto_3

    .line 237
    :catch_2
    move-exception v0

    goto :goto_2

    :catch_3
    move-exception v0

    goto :goto_1

    :catch_4
    move-exception v0

    goto :goto_0
.end method
