.class final Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;
.super Ljava/lang/Object;
.source "OAuthSignatureCalculator.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/oauth/OAuthSignatureCalculator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Parameter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;",
        ">;"
    }
.end annotation


# instance fields
.field private final key:Ljava/lang/String;

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 261
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 262
    iput-object p1, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->key:Ljava/lang/String;

    .line 263
    iput-object p2, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->value:Ljava/lang/String;

    .line 264
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;)I
    .locals 3
    .param p1, "other"    # Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;

    .prologue
    .line 276
    iget-object v1, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->key:Ljava/lang/String;

    iget-object v2, p1, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 277
    .local v0, "diff":I
    if-nez v0, :cond_0

    .line 278
    iget-object v1, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->value:Ljava/lang/String;

    iget-object v2, p1, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 280
    :cond_0
    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 258
    check-cast p1, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->compareTo(Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 290
    if-ne p0, p1, :cond_1

    .line 298
    :cond_0
    :goto_0
    return v1

    .line 291
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 293
    check-cast v0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;

    .line 295
    .local v0, "parameter":Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;
    iget-object v3, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->key:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    goto :goto_0

    .line 296
    :cond_4
    iget-object v3, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->value:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 303
    iget-object v1, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->key:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 304
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->value:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 305
    return v0
.end method

.method public key()Ljava/lang/String;
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->key:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 285
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public value()Ljava/lang/String;
    .locals 1

    .prologue
    .line 271
    iget-object v0, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->value:Ljava/lang/String;

    return-object v0
.end method
