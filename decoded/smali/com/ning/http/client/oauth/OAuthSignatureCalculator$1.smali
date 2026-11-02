.class final Lcom/ning/http/client/oauth/OAuthSignatureCalculator$1;
.super Ljava/lang/ThreadLocal;
.source "OAuthSignatureCalculator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/oauth/OAuthSignatureCalculator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<[B>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$1;->initialValue()[B

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()[B
    .locals 1

    .prologue
    .line 63
    const/16 v0, 0x10

    new-array v0, v0, [B

    return-object v0
.end method
