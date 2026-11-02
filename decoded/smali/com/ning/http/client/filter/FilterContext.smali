.class public Lcom/ning/http/client/filter/FilterContext;
.super Ljava/lang/Object;
.source "FilterContext.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/filter/FilterContext$1;,
        Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;
    }
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
.field private final b:Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<TT;>;"
    .local p1, "b":Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;, "Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/ning/http/client/filter/FilterContext;->b:Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    .line 45
    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;Lcom/ning/http/client/filter/FilterContext$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;
    .param p2, "x1"    # Lcom/ning/http/client/filter/FilterContext$1;

    .prologue
    .line 34
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<TT;>;"
    invoke-direct {p0, p1}, Lcom/ning/http/client/filter/FilterContext;-><init>(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)V

    return-void
.end method


# virtual methods
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
    .line 53
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext;->b:Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-static {v0}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->access$000(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Lcom/ning/http/client/AsyncHandler;

    move-result-object v0

    return-object v0
.end method

.method public getIOException()Ljava/io/IOException;
    .locals 1

    .prologue
    .line 96
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext;->b:Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-static {v0}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->access$500(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Ljava/io/IOException;

    move-result-object v0

    return-object v0
.end method

.method public getRequest()Lcom/ning/http/client/Request;
    .locals 1

    .prologue
    .line 62
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext;->b:Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-static {v0}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->access$100(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Lcom/ning/http/client/Request;

    move-result-object v0

    return-object v0
.end method

.method public getResponseHeaders()Lcom/ning/http/client/HttpResponseHeaders;
    .locals 1

    .prologue
    .line 78
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext;->b:Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-static {v0}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->access$300(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Lcom/ning/http/client/HttpResponseHeaders;

    move-result-object v0

    return-object v0
.end method

.method public getResponseStatus()Lcom/ning/http/client/HttpResponseStatus;
    .locals 1

    .prologue
    .line 71
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext;->b:Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-static {v0}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->access$200(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Lcom/ning/http/client/HttpResponseStatus;

    move-result-object v0

    return-object v0
.end method

.method public replayRequest()Z
    .locals 1

    .prologue
    .line 87
    .local p0, "this":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/filter/FilterContext;->b:Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-static {v0}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->access$400(Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;)Z

    move-result v0

    return v0
.end method
