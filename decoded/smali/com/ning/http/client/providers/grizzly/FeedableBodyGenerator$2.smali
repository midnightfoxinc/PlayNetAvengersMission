.class Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$2;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"

# interfaces
.implements Lorg/glassfish/grizzly/ssl/SSLBaseFilter$HandshakeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->flushOnSSLHandshakeComplete()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

.field final synthetic val$c:Lorg/glassfish/grizzly/Connection;

.field final synthetic val$filter:Lorg/glassfish/grizzly/ssl/SSLFilter;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/Connection;Lorg/glassfish/grizzly/ssl/SSLFilter;)V
    .locals 0

    .prologue
    .line 210
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$2;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$2;->val$c:Lorg/glassfish/grizzly/Connection;

    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$2;->val$filter:Lorg/glassfish/grizzly/ssl/SSLFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lorg/glassfish/grizzly/Connection;)V
    .locals 2
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 215
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$2;->val$c:Lorg/glassfish/grizzly/Connection;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 216
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$2;->val$filter:Lorg/glassfish/grizzly/ssl/SSLFilter;

    invoke-virtual {v1, p0}, Lorg/glassfish/grizzly/ssl/SSLFilter;->removeHandshakeListener(Lorg/glassfish/grizzly/ssl/SSLBaseFilter$HandshakeListener;)V

    .line 218
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$2;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$200(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;

    move-result-object v1

    invoke-interface {v1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    :cond_0
    :goto_0
    return-void

    .line 219
    :catch_0
    move-exception v0

    .line 220
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$2;->val$c:Lorg/glassfish/grizzly/Connection;

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onStart(Lorg/glassfish/grizzly/Connection;)V
    .locals 0
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 212
    return-void
.end method
