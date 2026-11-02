.class Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$3;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lorg/glassfish/grizzly/utils/IdleTimeoutFilter$TimeoutHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->initializeTransport(Lcom/ning/http/client/AsyncHttpClientConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V
    .locals 0

    .prologue
    .line 352
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$3;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimeout(Lorg/glassfish/grizzly/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 354
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$3;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->timeout(Lorg/glassfish/grizzly/Connection;)V

    .line 355
    return-void
.end method
