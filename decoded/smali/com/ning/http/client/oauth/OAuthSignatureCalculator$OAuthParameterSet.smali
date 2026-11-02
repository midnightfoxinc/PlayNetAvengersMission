.class final Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;
.super Ljava/lang/Object;
.source "OAuthSignatureCalculator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/oauth/OAuthSignatureCalculator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "OAuthParameterSet"
.end annotation


# instance fields
.field private final allParameters:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->allParameters:Ljava/util/ArrayList;

    .line 230
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 233
    new-instance v0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;

    invoke-static {p1}, Lcom/ning/http/util/UTF8UrlEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Lcom/ning/http/util/UTF8UrlEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    .local v0, "p":Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;
    iget-object v1, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->allParameters:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 235
    return-object p0
.end method

.method public sortAndConcat()Ljava/lang/String;
    .locals 8

    .prologue
    .line 240
    iget-object v6, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->allParameters:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->allParameters:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;

    .line 241
    .local v5, "params":[Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;
    invoke-static {v5}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 244
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v6, 0x64

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 245
    .local v1, "encodedParams":Ljava/lang/StringBuilder;
    move-object v0, v5

    .local v0, "arr$":[Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 246
    .local v4, "param":Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 247
    const/16 v6, 0x26

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 249
    :cond_0
    invoke-virtual {v4}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->key()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x3d

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;->value()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 251
    .end local v4    # "param":Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method
