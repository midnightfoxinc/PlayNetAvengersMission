.class Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$1;
.super Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;->doHandle(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;

.field final synthetic val$multipartBody:Lcom/ning/http/client/multipart/MultipartBody;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;Lcom/ning/http/client/multipart/MultipartBody;)V
    .locals 0

    .prologue
    .line 1960
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$1;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;

    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$1;->val$multipartBody:Lcom/ning/http/client/multipart/MultipartBody;

    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;-><init>()V

    return-void
.end method


# virtual methods
.method public createBody()Lcom/ning/http/client/Body;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1963
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$1;->val$multipartBody:Lcom/ning/http/client/multipart/MultipartBody;

    return-object v0
.end method
