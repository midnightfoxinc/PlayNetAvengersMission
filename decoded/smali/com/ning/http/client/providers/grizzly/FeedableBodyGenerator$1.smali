.class Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->initializeAsynchronousTransfer(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

.field final synthetic val$c:Lorg/glassfish/grizzly/Connection;

.field final synthetic val$context:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

.field final synthetic val$requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/http/HttpRequestPacket;Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/Connection;)V
    .locals 0

    .prologue
    .line 169
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;->val$requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;

    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;->val$context:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    iput-object p4, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;->val$c:Lorg/glassfish/grizzly/Connection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 173
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;->val$requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->isSecure()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;->val$context:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v1

    invoke-static {v1}, Lorg/glassfish/grizzly/ssl/SSLUtils;->getSSLEngine(Lorg/glassfish/grizzly/Connection;)Ljavax/net/ssl/SSLEngine;

    move-result-object v1

    if-nez v1, :cond_0

    .line 175
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$100(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)V

    .line 182
    :goto_0
    return-void

    .line 177
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$200(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;

    move-result-object v1

    invoke-interface {v1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 179
    :catch_0
    move-exception v0

    .line 180
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;->val$c:Lorg/glassfish/grizzly/Connection;

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
