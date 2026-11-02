.class public abstract Lcom/ning/http/client/providers/netty/request/body/NettyDirectBody;
.super Ljava/lang/Object;
.source "NettyDirectBody.java"

# interfaces
.implements Lcom/ning/http/client/providers/netty/request/body/NettyBody;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract channelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
.end method

.method public write(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/AsyncHttpClientConfig;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This kind of body is supposed to be writen directly"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
