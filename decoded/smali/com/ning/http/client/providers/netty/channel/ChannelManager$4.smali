.class Lcom/ning/http/client/providers/netty/channel/ChannelManager$4;
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

.field final synthetic val$httpProcessor:Lcom/ning/http/client/providers/netty/handler/Processor;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/providers/netty/handler/Processor;)V
    .locals 0

    .prologue
    .line 240
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$4;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    iput-object p2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$4;->val$httpProcessor:Lcom/ning/http/client/providers/netty/handler/Processor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 243
    invoke-static {}, Lorg/jboss/netty/channel/Channels;->pipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    .line 244
    .local v0, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    const-string v1, "sslHandler"

    new-instance v2, Lcom/ning/http/client/providers/netty/channel/SslInitializer;

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$4;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-direct {v2, v3}, Lcom/ning/http/client/providers/netty/channel/SslInitializer;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)V

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 245
    const-string v1, "httpHandler"

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$4;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$400(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 246
    const-string v1, "inflater"

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$4;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$500(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lorg/jboss/netty/handler/codec/http/HttpContentDecompressor;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 247
    const-string v1, "chunkedWriter"

    new-instance v2, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;

    invoke-direct {v2}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;-><init>()V

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 248
    const-string v1, "httpProcessor"

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$4;->val$httpProcessor:Lcom/ning/http/client/providers/netty/handler/Processor;

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 250
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$4;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$600(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getHttpsAdditionalPipelineInitializer()Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 251
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$4;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->access$600(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getHttpsAdditionalPipelineInitializer()Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;->initPipeline(Lorg/jboss/netty/channel/ChannelPipeline;)V

    .line 253
    :cond_0
    return-object v0
.end method
