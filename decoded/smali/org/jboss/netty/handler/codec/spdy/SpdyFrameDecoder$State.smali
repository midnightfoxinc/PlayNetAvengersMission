.class final enum Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;
.super Ljava/lang/Enum;
.source "SpdyFrameDecoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum DISCARD_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum FRAME_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_DATA_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_GOAWAY_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_HEADERS_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_PING_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_RST_STREAM_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_SETTING:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_SETTINGS_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_SYN_REPLY_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_SYN_STREAM_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field public static final enum READ_WINDOW_UPDATE_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 43
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_COMMON_HEADER"

    invoke-direct {v0, v1, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 44
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_DATA_FRAME"

    invoke-direct {v0, v1, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_DATA_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 45
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_SYN_STREAM_FRAME"

    invoke-direct {v0, v1, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SYN_STREAM_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 46
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_SYN_REPLY_FRAME"

    invoke-direct {v0, v1, v6}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SYN_REPLY_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 47
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_RST_STREAM_FRAME"

    invoke-direct {v0, v1, v7}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_RST_STREAM_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 48
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_SETTINGS_FRAME"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SETTINGS_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 49
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_SETTING"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SETTING:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 50
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_PING_FRAME"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_PING_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 51
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_GOAWAY_FRAME"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_GOAWAY_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 52
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_HEADERS_FRAME"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_HEADERS_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 53
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_WINDOW_UPDATE_FRAME"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_WINDOW_UPDATE_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 54
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "READ_HEADER_BLOCK"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 55
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "DISCARD_FRAME"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->DISCARD_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 56
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    const-string v1, "FRAME_ERROR"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->FRAME_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 42
    const/16 v0, 0xe

    new-array v0, v0, [Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v1, v0, v3

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_DATA_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v1, v0, v4

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SYN_STREAM_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v1, v0, v5

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SYN_REPLY_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v1, v0, v6

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_RST_STREAM_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SETTINGS_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SETTING:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_PING_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_GOAWAY_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_HEADERS_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_WINDOW_UPDATE_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->DISCARD_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->FRAME_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    aput-object v2, v0, v1

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->$VALUES:[Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 42
    const-class v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    return-object v0
.end method

.method public static values()[Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->$VALUES:[Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    invoke-virtual {v0}, [Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    return-object v0
.end method
