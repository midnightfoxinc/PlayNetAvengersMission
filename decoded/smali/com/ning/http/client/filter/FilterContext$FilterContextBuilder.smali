.class public Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;
.super Ljava/lang/Object;
.source "FilterContext.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/filter/FilterContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FilterContextBuilder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private asyncHandler:Lcom/ning/http/client/AsyncHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;"
        }
    .end annotation
.end field

.field private headers:Lcom/ning/http/client/HttpResponseHeaders;

.field private ioException:Ljava/io/IOException;

.field private replayRequest:Z

.field private request:Lcom/ning/http/client/Request;

.field private responseStatus:Lcom/ning/http/client/HttpResponseStatus;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    const/4 v1, 0x0

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object v1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    .line 101
    iput-object v1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request:Lcom/ning/http/client/Request;

    .line 102
    iput-object v1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->responseStatus:Lcom/ning/http/client/HttpResponseStatus;

    .line 103
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->replayRequest:Z

    .line 104
    iput-object v1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->ioException:Ljava/io/IOException;

    .line 108
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/filter/FilterContext;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/filter/FilterContext",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    .local p1, "clone":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<TT;>;"
    const/4 v1, 0x0

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object v1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    .line 101
    iput-object v1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request:Lcom/ning/http/client/Request;

    .line 102
    iput-object v1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->responseStatus:Lcom/ning/http/client/HttpResponseStatus;

    .line 103
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->replayRequest:Z

    .line 104
    iput-object v1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->ioException:Ljava/io/IOException;

    .line 111
    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    .line 112
    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request:Lcom/ning/http/client/Request;

    .line 113
    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getResponseStatus()Lcom/ning/http/client/HttpResponseStatus;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->responseStatus:Lcom/ning/http/client/HttpResponseStatus;

    .line 114
    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->replayRequest()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->replayRequest:Z

    .line 115
    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getIOException()Ljava/io/IOException;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->ioException:Ljava/io/IOException;

    .line 116
    return-void
.end method

.method static synthetic access$000(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Lcom/ning/http/client/AsyncHandler;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Lcom/ning/http/client/Request;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request:Lcom/ning/http/client/Request;

    return-object v0
.end method

.method static synthetic access$200(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Lcom/ning/http/client/HttpResponseStatus;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->responseStatus:Lcom/ning/http/client/HttpResponseStatus;

    return-object v0
.end method

.method static synthetic access$300(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Lcom/ning/http/client/HttpResponseHeaders;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    return-object v0
.end method

.method static synthetic access$400(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    .prologue
    .line 99
    iget-boolean v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->replayRequest:Z

    return v0
.end method

.method static synthetic access$500(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Ljava/io/IOException;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->ioException:Ljava/io/IOException;

    return-object v0
.end method


# virtual methods
.method public asyncHandler(Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;)",
            "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 123
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    .local p1, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    iput-object p1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    .line 124
    return-object p0
.end method

.method public build()Lcom/ning/http/client/filter/FilterContext;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/ning/http/client/filter/FilterContext",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    new-instance v0, Lcom/ning/http/client/filter/FilterContext;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/ning/http/client/filter/FilterContext;-><init>(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;Lcom/ning/http/client/filter/FilterContext$1;)V

    return-object v0
.end method

.method public getAsyncHandler()Lcom/ning/http/client/AsyncHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    return-object v0
.end method

.method public getRequest()Lcom/ning/http/client/Request;
    .locals 1

    .prologue
    .line 128
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request:Lcom/ning/http/client/Request;

    return-object v0
.end method

.method public ioException(Ljava/io/IOException;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;
    .locals 0
    .param p1, "ioException"    # Ljava/io/IOException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/IOException;",
            ")",
            "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 152
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    iput-object p1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->ioException:Ljava/io/IOException;

    .line 153
    return-object p0
.end method

.method public replayRequest(Z)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;
    .locals 0
    .param p1, "replayRequest"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 147
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    iput-boolean p1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->replayRequest:Z

    .line 148
    return-object p0
.end method

.method public request(Lcom/ning/http/client/Request;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;
    .locals 0
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/Request;",
            ")",
            "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 132
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    iput-object p1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request:Lcom/ning/http/client/Request;

    .line 133
    return-object p0
.end method

.method public responseHeaders(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;
    .locals 0
    .param p1, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/HttpResponseHeaders;",
            ")",
            "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    iput-object p1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    .line 143
    return-object p0
.end method

.method public responseStatus(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;
    .locals 0
    .param p1, "responseStatus"    # Lcom/ning/http/client/HttpResponseStatus;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/HttpResponseStatus;",
            ")",
            "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    iput-object p1, p0, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->responseStatus:Lcom/ning/http/client/HttpResponseStatus;

    .line 138
    return-object p0
.end method
