.class public Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;
.super Ljava/lang/Object;
.source "EMTKeyStrategy.java"


# static fields
.field private static instance:Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;->instance:Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;->instance:Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;

    .line 31
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;->instance:Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;

    return-object v0
.end method


# virtual methods
.method public requiredKey(I)B
    .locals 3
    .param p1, "command"    # I

    .prologue
    .line 48
    const/4 v0, 0x0

    .line 52
    .local v0, "keySlot":B
    sparse-switch p1, :sswitch_data_0

    .line 55
    const/4 v0, 0x0

    .line 101
    :goto_0
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-result-object v1

    .line 103
    .local v1, "keyStore":Lcom/disney/emagine/sdk/keystore/EMTKeyStore;
    if-nez v0, :cond_0

    .line 105
    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->isKeyAvailable(B)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 107
    const/4 v0, 0x2

    .line 116
    :cond_0
    :goto_1
    return v0

    .line 67
    .end local v1    # "keyStore":Lcom/disney/emagine/sdk/keystore/EMTKeyStore;
    :sswitch_0
    const/4 v0, 0x1

    .line 68
    goto :goto_0

    .line 90
    :sswitch_1
    const/4 v0, 0x2

    .line 91
    goto :goto_0

    .line 96
    :sswitch_2
    const/4 v0, 0x3

    goto :goto_0

    .line 109
    .restart local v1    # "keyStore":Lcom/disney/emagine/sdk/keystore/EMTKeyStore;
    :cond_1
    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->isKeyAvailable(B)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 111
    const/4 v0, 0x3

    goto :goto_1

    .line 52
    nop

    :sswitch_data_0
    .sparse-switch
        0x138b -> :sswitch_0
        0x1580 -> :sswitch_0
        0x1581 -> :sswitch_0
        0x1582 -> :sswitch_2
        0x158a -> :sswitch_0
        0x158c -> :sswitch_0
        0x158f -> :sswitch_0
        0x1590 -> :sswitch_0
        0x1645 -> :sswitch_2
        0x1647 -> :sswitch_2
        0x1648 -> :sswitch_1
        0x164a -> :sswitch_1
        0x1b5e -> :sswitch_1
        0x1f47 -> :sswitch_1
        0x232a -> :sswitch_1
        0x232b -> :sswitch_1
        0x232c -> :sswitch_1
        0x232e -> :sswitch_1
        0x2330 -> :sswitch_1
        0x2332 -> :sswitch_1
        0x2334 -> :sswitch_1
        0x2335 -> :sswitch_1
        0x2336 -> :sswitch_1
        0x3fff -> :sswitch_1
        0x4000 -> :sswitch_1
        0x4001 -> :sswitch_1
        0x4002 -> :sswitch_1
        0x4003 -> :sswitch_1
        0x4004 -> :sswitch_1
        0x400a -> :sswitch_1
        0x400d -> :sswitch_0
        0x400e -> :sswitch_0
    .end sparse-switch
.end method

.method public sufficientKeySlot(BI)Z
    .locals 4
    .param p1, "keySlot"    # B
    .param p2, "command"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 36
    invoke-virtual {p0, p2}, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;->requiredKey(I)B

    move-result v0

    .line 38
    .local v0, "requiredKeySlot":B
    if-nez v0, :cond_2

    .line 40
    const/4 v3, 0x2

    if-eq p1, v3, :cond_0

    const/4 v3, 0x3

    if-ne p1, v3, :cond_1

    :cond_0
    move v1, v2

    .line 43
    :cond_1
    :goto_0
    return v1

    :cond_2
    if-ne v0, p1, :cond_3

    :goto_1
    move v1, v2

    goto :goto_0

    :cond_3
    move v2, v1

    goto :goto_1
.end method
