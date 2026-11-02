.class public final Lcom/ning/http/client/providers/netty/channel/Channels;
.super Ljava/lang/Object;
.source "Channels.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/ning/http/client/providers/netty/channel/Channels;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/channel/Channels;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public static getAttribute(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;
    .locals 1
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 34
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getAttachment()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static isChannelValid(Lorg/jboss/netty/channel/Channel;)Z
    .locals 1
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 42
    if-eqz p0, :cond_0

    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static setAttribute(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V
    .locals 0
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "attribute"    # Ljava/lang/Object;

    .prologue
    .line 30
    invoke-interface {p0, p1}, Lorg/jboss/netty/channel/Channel;->setAttachment(Ljava/lang/Object;)V

    .line 31
    return-void
.end method

.method public static setDiscard(Lorg/jboss/netty/channel/Channel;)V
    .locals 1
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 38
    sget-object v0, Lcom/ning/http/client/providers/netty/DiscardEvent;->INSTANCE:Lcom/ning/http/client/providers/netty/DiscardEvent;

    invoke-static {p0, v0}, Lcom/ning/http/client/providers/netty/channel/Channels;->setAttribute(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V

    .line 39
    return-void
.end method

.method public static silentlyCloseChannel(Lorg/jboss/netty/channel/Channel;)V
    .locals 3
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 47
    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 48
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    :cond_0
    :goto_0
    return-void

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v1, Lcom/ning/http/client/providers/netty/channel/Channels;->LOGGER:Lorg/slf4j/Logger;

    const-string v2, "Failed to close channel"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
