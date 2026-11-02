.class public final enum Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
.super Ljava/lang/Enum;
.source "SpdyVersion.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

.field public static final enum SPDY_3_1:Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;


# instance fields
.field private final minorVersion:I

.field private final version:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 19
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    const-string v1, "SPDY_3_1"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v3, v2, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->SPDY_3_1:Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    .line 18
    new-array v0, v4, [Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->SPDY_3_1:Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    aput-object v1, v0, v3

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->$VALUES:[Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .param p3, "version"    # I
    .param p4, "minorVersion"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)V"
        }
    .end annotation

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 25
    iput p3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->version:I

    .line 26
    iput p4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->minorVersion:I

    .line 27
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 18
    const-class v0, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    return-object v0
.end method

.method public static values()[Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .locals 1

    .prologue
    .line 18
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->$VALUES:[Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    invoke-virtual {v0}, [Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    return-object v0
.end method


# virtual methods
.method getMinorVersion()I
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->minorVersion:I

    return v0
.end method

.method getVersion()I
    .locals 1

    .prologue
    .line 30
    iget v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->version:I

    return v0
.end method
