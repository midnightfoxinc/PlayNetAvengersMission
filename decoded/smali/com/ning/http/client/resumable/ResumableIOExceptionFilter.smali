.class public Lcom/ning/http/client/resumable/ResumableIOExceptionFilter;
.super Ljava/lang/Object;
.source "ResumableIOExceptionFilter.java"

# interfaces
.implements Lcom/ning/http/client/filter/IOExceptionFilter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public filter(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;
    .locals 3
    .param p1, "ctx"    # Lcom/ning/http/client/filter/FilterContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/filter/FilterException;
        }
    .end annotation

    .prologue
    .line 27
    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getIOException()Ljava/io/IOException;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v1

    instance-of v1, v1, Lcom/ning/http/client/resumable/ResumableAsyncHandler;

    if-eqz v1, :cond_0

    .line 29
    const-class v1, Lcom/ning/http/client/resumable/ResumableAsyncHandler;

    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/resumable/ResumableAsyncHandler;

    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->adjustRequestRange(Lcom/ning/http/client/Request;)Lcom/ning/http/client/Request;

    move-result-object v0

    .line 31
    .local v0, "request":Lcom/ning/http/client/Request;
    new-instance v1, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-direct {v1, p1}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;-><init>(Lcom/ning/http/client/filter/FilterContext;)V

    invoke-virtual {v1, v0}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request(Lcom/ning/http/client/Request;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->replayRequest(Z)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->build()Lcom/ning/http/client/filter/FilterContext;

    move-result-object p1

    .line 33
    .end local v0    # "request":Lcom/ning/http/client/Request;
    .end local p1    # "ctx":Lcom/ning/http/client/filter/FilterContext;
    :cond_0
    return-object p1
.end method
