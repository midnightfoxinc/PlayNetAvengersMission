.class public Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$DefaultNettyWebSocketFactory;
.super Ljava/lang/Object;
.source "NettyAsyncHttpProviderConfig.java"

# interfaces
.implements Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$NettyWebSocketFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DefaultNettyWebSocketFactory"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V
    .locals 0

    .prologue
    .line 329
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$DefaultNettyWebSocketFactory;->this$0:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newNettyWebSocket(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .prologue
    .line 333
    new-instance v0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;

    invoke-direct {v0, p1, p2}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;-><init>(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V

    return-object v0
.end method
