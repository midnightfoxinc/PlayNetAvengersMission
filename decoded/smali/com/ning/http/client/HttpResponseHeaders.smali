.class public abstract Lcom/ning/http/client/HttpResponseHeaders;
.super Ljava/lang/Object;
.source "HttpResponseHeaders.java"


# instance fields
.field private final traillingHeaders:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ning/http/client/HttpResponseHeaders;->traillingHeaders:Z

    .line 27
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0
    .param p1, "traillingHeaders"    # Z

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-boolean p1, p0, Lcom/ning/http/client/HttpResponseHeaders;->traillingHeaders:Z

    .line 31
    return-void
.end method


# virtual methods
.method public abstract getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
.end method

.method public isTraillingHeadersReceived()Z
    .locals 1

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/ning/http/client/HttpResponseHeaders;->traillingHeaders:Z

    return v0
.end method
