.class Lcom/ning/http/client/providers/netty/channel/ChannelManager$3;
.super Ljava/lang/Object;
.source "ChannelManager.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelPipelineFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/netty/channel/ChannelManager;->configureBootstraps(Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Ljava/util/concurrent/atomic/AtomicBoolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)V
    .locals 0

    .prologue
    .line 226
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$3;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 229
    invoke-static {}, Lorg/jboss/netty/channel/Channels;->pipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    .line 230
    .local v0, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    const-string v1, "httpHandler"

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$3;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$400(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 231
    const-string v1, "wsProcessor"

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$3;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$700(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lcom/ning/http/client/providers/netty/handler/Processor;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 233
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$3;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$600(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getWsAdditionalPipelineInitializer()Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 234
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$3;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$600(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getWsAdditionalPipelineInitializer()Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;->initPipeline(Lorg/jboss/netty/channel/ChannelPipeline;)V

    .line 236
    :cond_0
    return-object v0
.end method
