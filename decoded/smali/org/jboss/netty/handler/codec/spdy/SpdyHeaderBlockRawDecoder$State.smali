.class final enum Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;
.super Ljava/lang/Enum;
.source "SpdyHeaderBlockRawDecoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

.field public static final enum END_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

.field public static final enum ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

.field public static final enum READ_NAME:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

.field public static final enum READ_NAME_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

.field public static final enum READ_NUM_HEADERS:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

.field public static final enum READ_VALUE:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

.field public static final enum READ_VALUE_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

.field public static final enum SKIP_NAME:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

.field public static final enum SKIP_VALUE:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 39
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    const-string v1, "READ_NUM_HEADERS"

    invoke-direct {v0, v1, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NUM_HEADERS:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 40
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    const-string v1, "READ_NAME_LENGTH"

    invoke-direct {v0, v1, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NAME_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 41
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    const-string v1, "READ_NAME"

    invoke-direct {v0, v1, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NAME:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 42
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    const-string v1, "SKIP_NAME"

    invoke-direct {v0, v1, v6}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->SKIP_NAME:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 43
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    const-string v1, "READ_VALUE_LENGTH"

    invoke-direct {v0, v1, v7}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_VALUE_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 44
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    const-string v1, "READ_VALUE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_VALUE:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 45
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    const-string v1, "SKIP_VALUE"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->SKIP_VALUE:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 46
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    const-string v1, "END_HEADER_BLOCK"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->END_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 47
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    const-string v1, "ERROR"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 38
    const/16 v0, 0x9

    new-array v0, v0, [Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NUM_HEADERS:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    aput-object v1, v0, v3

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NAME_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    aput-object v1, v0, v4

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NAME:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    aput-object v1, v0, v5

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->SKIP_NAME:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    aput-object v1, v0, v6

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_VALUE_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_VALUE:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->SKIP_VALUE:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->END_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    aput-object v2, v0, v1

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->$VALUES:[Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

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
    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 38
    const-class v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    return-object v0
.end method

.method public static values()[Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->$VALUES:[Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    invoke-virtual {v0}, [Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    return-object v0
.end method
