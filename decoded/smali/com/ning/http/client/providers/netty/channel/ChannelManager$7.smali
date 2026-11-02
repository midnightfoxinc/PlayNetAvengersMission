.class Lcom/ning/http/client/providers/netty/channel/ChannelManager$7;
.super Lcom/ning/http/client/providers/netty/Callback;
.source "ChannelManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/netty/channel/ChannelManager;->newDrainCallback(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;ZLjava/lang/String;)Lcom/ning/http/client/providers/netty/Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

.field final synthetic val$channel:Lorg/jboss/netty/channel/Channel;

.field final synthetic val$keepAlive:Z

.field final synthetic val$partition:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;ZLjava/lang/String;)V
    .locals 0

    .prologue
    .line 464
    .local p2, "x0":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$7;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    iput-object p3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$7;->val$channel:Lorg/jboss/netty/channel/Channel;

    iput-boolean p4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$7;->val$keepAlive:Z

    iput-object p5, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$7;->val$partition:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/ning/http/client/providers/netty/Callback;-><init>(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V

    return-void
.end method


# virtual methods
.method public call()V
    .locals 4

    .prologue
    .line 467
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$7;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$7;->val$channel:Lorg/jboss/netty/channel/Channel;

    iget-boolean v2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$7;->val$keepAlive:Z

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$7;->val$partition:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->tryToOfferChannelToPool(Lorg/jboss/netty/channel/Channel;ZLjava/lang/String;)V

    .line 468
    return-void
.end method
