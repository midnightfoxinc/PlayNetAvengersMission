.class public final Lorg/jboss/netty/handler/codec/rtsp/RtspVersions;
.super Ljava/lang/Object;
.source "RtspVersions.java"


# static fields
.field public static final RTSP_1_0:Lorg/jboss/netty/handler/codec/http/HttpVersion;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 29
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpVersion;

    const-string v1, "RTSP"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v3, v2, v3}, Lorg/jboss/netty/handler/codec/http/HttpVersion;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lorg/jboss/netty/handler/codec/rtsp/RtspVersions;->RTSP_1_0:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpVersion;
    .locals 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 38
    if-nez p0, :cond_0

    .line 39
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "text"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    .line 43
    const-string v0, "RTSP/1.0"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 44
    sget-object v0, Lorg/jboss/netty/handler/codec/rtsp/RtspVersions;->RTSP_1_0:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    .line 47
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpVersion;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lorg/jboss/netty/handler/codec/http/HttpVersion;-><init>(Ljava/lang/String;Z)V

    goto :goto_0
.end method
