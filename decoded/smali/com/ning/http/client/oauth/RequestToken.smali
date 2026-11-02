.class public Lcom/ning/http/client/oauth/RequestToken;
.super Ljava/lang/Object;
.source "RequestToken.java"


# instance fields
.field private final key:Ljava/lang/String;

.field private final secret:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "token"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/ning/http/client/oauth/RequestToken;->key:Ljava/lang/String;

    .line 30
    iput-object p2, p0, Lcom/ning/http/client/oauth/RequestToken;->secret:Ljava/lang/String;

    .line 31
    return-void
.end method

.method private appendValue(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/16 v0, 0x22

    .line 52
    if-nez p2, :cond_0

    .line 53
    const-string v0, "null"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    :goto_0
    return-void

    .line 55
    :cond_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 68
    if-ne p1, p0, :cond_1

    .line 71
    :cond_0
    :goto_0
    return v1

    .line 69
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 70
    check-cast v0, Lcom/ning/http/client/oauth/RequestToken;

    .line 71
    .local v0, "other":Lcom/ning/http/client/oauth/RequestToken;
    iget-object v3, p0, Lcom/ning/http/client/oauth/RequestToken;->key:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/oauth/RequestToken;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/ning/http/client/oauth/RequestToken;->secret:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/oauth/RequestToken;->secret:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_4
    move v1, v2

    goto :goto_0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/ning/http/client/oauth/RequestToken;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getSecret()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/ning/http/client/oauth/RequestToken;->secret:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/ning/http/client/oauth/RequestToken;->key:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/ning/http/client/oauth/RequestToken;->secret:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "{ key="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/ning/http/client/oauth/RequestToken;->key:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/ning/http/client/oauth/RequestToken;->appendValue(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 45
    const-string v1, ", secret="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    iget-object v1, p0, Lcom/ning/http/client/oauth/RequestToken;->secret:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/ning/http/client/oauth/RequestToken;->appendValue(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 47
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
