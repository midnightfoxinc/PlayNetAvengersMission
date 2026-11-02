.class Lcom/ning/http/client/providers/netty/channel/ChannelManager$1;
.super Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;
.source "ChannelManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/netty/channel/ChannelManager;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lorg/jboss/netty/util/Timer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Ljava/lang/String;)V
    .locals 0
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$1;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-direct {p0, p2}, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public remove(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 136
    invoke-super {p0, p1}, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->remove(Ljava/lang/Object;)Z

    move-result v2

    .line 137
    .local v2, "removed":Z
    if-eqz v2, :cond_0

    .line 138
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$1;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v3}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$000(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Ljava/util/concurrent/Semaphore;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .line 139
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$1;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v3}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$100(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 140
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$1;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v3}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$200(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v4

    const-class v3, Lorg/jboss/netty/channel/Channel;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jboss/netty/channel/Channel;

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 141
    .local v1, "partition":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 142
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$1;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v3}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$300(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Semaphore;

    .line 143
    .local v0, "freeChannelsForHost":Ljava/util/concurrent/Semaphore;
    if-eqz v0, :cond_0

    .line 144
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 148
    .end local v0    # "freeChannelsForHost":Ljava/util/concurrent/Semaphore;
    .end local v1    # "partition":Ljava/lang/String;
    :cond_0
    return v2
.end method
