.class public Lcom/ning/http/client/Param;
.super Ljava/lang/Object;
.source "Param.java"


# instance fields
.field private final name:Ljava/lang/String;

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/ning/http/client/Param;->name:Ljava/lang/String;

    .line 25
    iput-object p2, p0, Lcom/ning/http/client/Param;->value:Ljava/lang/String;

    .line 26
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 43
    if-ne p0, p1, :cond_1

    .line 60
    :cond_0
    :goto_0
    return v1

    .line 45
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    instance-of v3, p1, Lcom/ning/http/client/Param;

    if-nez v3, :cond_3

    move v1, v2

    .line 48
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 49
    check-cast v0, Lcom/ning/http/client/Param;

    .line 50
    .local v0, "other":Lcom/ning/http/client/Param;
    iget-object v3, p0, Lcom/ning/http/client/Param;->name:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 51
    iget-object v3, v0, Lcom/ning/http/client/Param;->name:Ljava/lang/String;

    if-eqz v3, :cond_5

    move v1, v2

    .line 52
    goto :goto_0

    .line 53
    :cond_4
    iget-object v3, p0, Lcom/ning/http/client/Param;->name:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/Param;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 54
    goto :goto_0

    .line 55
    :cond_5
    iget-object v3, p0, Lcom/ning/http/client/Param;->value:Ljava/lang/String;

    if-nez v3, :cond_6

    .line 56
    iget-object v3, v0, Lcom/ning/http/client/Param;->value:Ljava/lang/String;

    if-eqz v3, :cond_0

    move v1, v2

    .line 57
    goto :goto_0

    .line 58
    :cond_6
    iget-object v3, p0, Lcom/ning/http/client/Param;->value:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/Param;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 59
    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/ning/http/client/Param;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/ning/http/client/Param;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 35
    const/16 v0, 0x1f

    .line 36
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 37
    .local v1, "result":I
    iget-object v2, p0, Lcom/ning/http/client/Param;->name:Ljava/lang/String;

    if-nez v2, :cond_0

    move v2, v3

    :goto_0
    add-int/lit8 v1, v2, 0x1f

    .line 38
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/ning/http/client/Param;->value:Ljava/lang/String;

    if-nez v4, :cond_1

    :goto_1
    add-int v1, v2, v3

    .line 39
    return v1

    .line 37
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/Param;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0

    .line 38
    :cond_1
    iget-object v3, p0, Lcom/ning/http/client/Param;->value:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_1
.end method
