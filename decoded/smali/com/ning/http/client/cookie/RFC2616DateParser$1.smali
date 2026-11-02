.class final Lcom/ning/http/client/cookie/RFC2616DateParser$1;
.super Ljava/lang/ThreadLocal;
.source "RFC2616DateParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/cookie/RFC2616DateParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Lcom/ning/http/client/cookie/RFC2616DateParser;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected initialValue()Lcom/ning/http/client/cookie/RFC2616DateParser;
    .locals 2

    .prologue
    .line 36
    new-instance v0, Lcom/ning/http/client/cookie/RFC2616DateParser;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/ning/http/client/cookie/RFC2616DateParser;-><init>(Lcom/ning/http/client/cookie/RFC2616DateParser$1;)V

    return-object v0
.end method

.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 33
    invoke-virtual {p0}, Lcom/ning/http/client/cookie/RFC2616DateParser$1;->initialValue()Lcom/ning/http/client/cookie/RFC2616DateParser;

    move-result-object v0

    return-object v0
.end method
