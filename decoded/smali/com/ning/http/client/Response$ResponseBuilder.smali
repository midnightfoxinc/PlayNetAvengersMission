.class public Lcom/ning/http/client/Response$ResponseBuilder;
.super Ljava/lang/Object;
.source "Response.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/Response;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResponseBuilder"
.end annotation


# instance fields
.field private final bodyParts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;"
        }
    .end annotation
.end field

.field private headers:Lcom/ning/http/client/HttpResponseHeaders;

.field private status:Lcom/ning/http/client/HttpResponseStatus;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/Response$ResponseBuilder;->bodyParts:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public accumulate(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/Response$ResponseBuilder;
    .locals 1
    .param p1, "bodyPart"    # Lcom/ning/http/client/HttpResponseBodyPart;

    .prologue
    .line 206
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseBodyPart;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 207
    iget-object v0, p0, Lcom/ning/http/client/Response$ResponseBuilder;->bodyParts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    :cond_0
    return-object p0
.end method

.method public accumulate(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/Response$ResponseBuilder;
    .locals 0
    .param p1, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;

    .prologue
    .line 196
    iput-object p1, p0, Lcom/ning/http/client/Response$ResponseBuilder;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    .line 197
    return-object p0
.end method

.method public accumulate(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/Response$ResponseBuilder;
    .locals 0
    .param p1, "status"    # Lcom/ning/http/client/HttpResponseStatus;

    .prologue
    .line 191
    iput-object p1, p0, Lcom/ning/http/client/Response$ResponseBuilder;->status:Lcom/ning/http/client/HttpResponseStatus;

    .line 192
    return-object p0
.end method

.method public build()Lcom/ning/http/client/Response;
    .locals 3

    .prologue
    .line 217
    iget-object v0, p0, Lcom/ning/http/client/Response$ResponseBuilder;->status:Lcom/ning/http/client/HttpResponseStatus;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/Response$ResponseBuilder;->status:Lcom/ning/http/client/HttpResponseStatus;

    iget-object v1, p0, Lcom/ning/http/client/Response$ResponseBuilder;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    iget-object v2, p0, Lcom/ning/http/client/Response$ResponseBuilder;->bodyParts:Ljava/util/List;

    invoke-virtual {v0, v1, v2}, Lcom/ning/http/client/HttpResponseStatus;->prepareResponse(Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)Lcom/ning/http/client/Response;

    move-result-object v0

    goto :goto_0
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 224
    iget-object v0, p0, Lcom/ning/http/client/Response$ResponseBuilder;->bodyParts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 225
    iput-object v1, p0, Lcom/ning/http/client/Response$ResponseBuilder;->status:Lcom/ning/http/client/HttpResponseStatus;

    .line 226
    iput-object v1, p0, Lcom/ning/http/client/Response$ResponseBuilder;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    .line 227
    return-void
.end method
