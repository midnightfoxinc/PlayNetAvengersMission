.class public Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;
.super Ljava/lang/Object;
.source "UICKeyChainStore.java"

# interfaces
.implements Lcom/disney/emagine/sdk/keystore/EMTKeyStoreKeys;


# static fields
.field private static defaultService:Ljava/lang/String;

.field public static instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;


# instance fields
.field private accessGroup:Ljava/lang/String;

.field private itemsToUpdate:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private service:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    .line 29
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 31
    const-class v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    invoke-virtual {v0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->service:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 36
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    iput-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->service:Ljava/lang/String;

    .line 39
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    .line 40
    return-void
.end method

.method public static dataForKeyDefaultService(Ljava/lang/String;)[B
    .locals 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 174
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->dataForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static dataForKeyService(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "service"    # Ljava/lang/String;

    .prologue
    .line 179
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->dataForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static dataForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B
    .locals 4
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "accessGroup"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 184
    if-nez p0, :cond_1

    .line 213
    :cond_0
    :goto_0
    return-object v2

    .line 189
    :cond_1
    if-nez p1, :cond_2

    .line 191
    sget-object p1, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    .line 194
    :cond_2
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 196
    .local v1, "query":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "kSecAttrService"

    invoke-virtual {v1, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    const-string v3, "kSecAttrAccount"

    invoke-virtual {v1, v3, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    if-eqz p2, :cond_3

    .line 201
    const-string v3, "kSecAttrAccessGroup"

    invoke-virtual {v1, v3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    :cond_3
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->secItem()Lcom/disney/emagine/sdk/keystore/EMTSecItem;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->getData(Ljava/util/HashMap;)[B

    move-result-object v0

    .line 206
    .local v0, "data":[B
    if-eqz v0, :cond_0

    move-object v2, v0

    .line 211
    check-cast v2, [B

    .line 213
    .local v2, "ret":[B
    goto :goto_0
.end method

.method public static defaultService()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    return-object v0
.end method

.method public static itemsForServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 4
    .param p0, "service"    # Ljava/lang/String;
    .param p1, "accessGroup"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 367
    if-nez p0, :cond_0

    .line 369
    sget-object p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    .line 372
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 374
    .local v0, "query":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "kSecReturnAttributes"

    const-string v3, "kCFBooleanTrue"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    const-string v2, "kSecReturnData"

    const-string v3, "kCFBooleanTrue"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    const-string v2, "kSecMatchLimit"

    const-string v3, "kSecMatchLimitAll"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    const-string v2, "kSecAttrService"

    invoke-virtual {v0, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    if-eqz p1, :cond_1

    .line 381
    const-string v2, "kSecAttrAccessGroup"

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    :cond_1
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->secItem()Lcom/disney/emagine/sdk/keystore/EMTSecItem;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->copyMatching(Ljava/util/HashMap;)Ljava/util/ArrayList;

    move-result-object v1

    .line 386
    .local v1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    return-object v1
.end method

.method public static keyChainStore(Ljava/lang/String;)Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;
    .locals 2
    .param p0, "service"    # Ljava/lang/String;

    .prologue
    .line 64
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    invoke-virtual {v0, p0}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setService(Ljava/lang/String;)V

    .line 65
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setAccessGroup(Ljava/lang/String;)V

    .line 67
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    return-object v0
.end method

.method public static keyChainStore(Ljava/lang/String;Ljava/lang/String;)Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;
    .locals 1
    .param p0, "service"    # Ljava/lang/String;
    .param p1, "accessGroup"    # Ljava/lang/String;

    .prologue
    .line 72
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    invoke-virtual {v0, p0}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setService(Ljava/lang/String;)V

    .line 73
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setAccessGroup(Ljava/lang/String;)V

    .line 75
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    return-object v0
.end method

.method public static removeAllItems()Z
    .locals 2

    .prologue
    .line 391
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->removeAllItemsForServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static removeAllItemsForService(Ljava/lang/String;)Z
    .locals 1
    .param p0, "service"    # Ljava/lang/String;

    .prologue
    .line 396
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->removeAllItemsForServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static removeAllItemsForServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .param p0, "service"    # Ljava/lang/String;
    .param p1, "accessGroup"    # Ljava/lang/String;

    .prologue
    .line 401
    invoke-static {p0, p1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsForServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 403
    .local v2, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 405
    .local v0, "item":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 407
    .local v1, "itemToDelete":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "kSecClass"

    const-string v6, "kSecClassGenericPassword"

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->secItem()Lcom/disney/emagine/sdk/keystore/EMTSecItem;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->delete(Ljava/util/HashMap;)I

    move-result v3

    .line 411
    .local v3, "status":I
    if-eqz v3, :cond_0

    .line 413
    const/4 v4, 0x0

    .line 417
    .end local v0    # "item":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "itemToDelete":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "status":I
    :goto_0
    return v4

    :cond_1
    const/4 v4, 0x1

    goto :goto_0
.end method

.method public static removeItemForKey(Ljava/lang/String;)Z
    .locals 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 323
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->removeItemForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static removeItemForKeyService(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "service"    # Ljava/lang/String;

    .prologue
    .line 328
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->removeItemForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static removeItemForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "accessGroup"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 333
    if-nez p0, :cond_1

    .line 362
    :cond_0
    :goto_0
    return v2

    .line 338
    :cond_1
    if-nez p1, :cond_2

    .line 340
    sget-object p1, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    .line 343
    :cond_2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 345
    .local v0, "itemToDelete":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "kSecClass"

    const-string v5, "kSecClassGenericPassword"

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    const-string v4, "kSecAttrService"

    invoke-virtual {v0, v4, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    const-string v4, "kSecAttrGeneric"

    invoke-virtual {v0, v4, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    const-string v4, "kSecAttrAccount"

    invoke-virtual {v0, v4, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    if-eqz p2, :cond_3

    .line 352
    const-string v4, "kSecAttrAccessGroup"

    invoke-virtual {v0, v4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    :cond_3
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->secItem()Lcom/disney/emagine/sdk/keystore/EMTSecItem;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->delete(Ljava/util/HashMap;)I

    move-result v1

    .line 357
    .local v1, "status":I
    if-eqz v1, :cond_4

    if-ne v1, v3, :cond_0

    :cond_4
    move v2, v3

    .line 362
    goto :goto_0
.end method

.method public static secItem()Lcom/disney/emagine/sdk/keystore/EMTSecItem;
    .locals 1

    .prologue
    .line 122
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTSecItem;

    move-result-object v0

    return-object v0
.end method

.method public static setDataForKeyDefaultService([BLjava/lang/String;)Z
    .locals 2
    .param p0, "data"    # [B
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 218
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setDataForKeyServiceAccessGroup(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static setDataForKeyService([BLjava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "data"    # [B
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "service"    # Ljava/lang/String;

    .prologue
    .line 223
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setDataForKeyServiceAccessGroup(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static setDataForKeyServiceAccessGroup(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "service"    # Ljava/lang/String;
    .param p3, "accessGroup"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 228
    if-nez p1, :cond_1

    .line 256
    :cond_0
    :goto_0
    return v2

    .line 233
    :cond_1
    if-nez p2, :cond_2

    .line 235
    sget-object p2, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    .line 238
    :cond_2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 240
    .local v0, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "kSecAttrService"

    invoke-virtual {v0, v3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    const-string v3, "kSecAttrAccount"

    invoke-virtual {v0, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    const-string v3, "kSecValueData"

    invoke-virtual {v0, v3, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    if-eqz p3, :cond_3

    .line 246
    const-string v3, "kSecAttrAccessGroup"

    invoke-virtual {v0, v3, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    :cond_3
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->secItem()Lcom/disney/emagine/sdk/keystore/EMTSecItem;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->add(Ljava/util/HashMap;)I

    move-result v1

    .line 251
    .local v1, "status":I
    if-nez v1, :cond_0

    .line 256
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static setDefaultService(Ljava/lang/String;)V
    .locals 0
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 59
    sput-object p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public static setStringForKeyDefaultService(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 157
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setStringForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static setStringForKeyService(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "service"    # Ljava/lang/String;

    .prologue
    .line 162
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setStringForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static setStringForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "service"    # Ljava/lang/String;
    .param p3, "accessGroup"    # Ljava/lang/String;

    .prologue
    .line 167
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 169
    .local v0, "data":[B
    invoke-static {v0, p1, p2, p3}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setDataForKeyServiceAccessGroup(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;
    .locals 1

    .prologue
    .line 44
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    if-nez v0, :cond_0

    .line 46
    new-instance v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    .line 49
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    return-object v0
.end method

.method public static stringForKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 127
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->stringForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static stringForKeyService(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "service"    # Ljava/lang/String;

    .prologue
    .line 132
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->stringForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static stringForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "accessGroup"    # Ljava/lang/String;

    .prologue
    .line 137
    invoke-static {p0, p1, p2}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->dataForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 139
    .local v0, "data":[B
    if-eqz v0, :cond_0

    .line 143
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    :goto_0
    return-object v2

    .line 145
    :catch_0
    move-exception v1

    .line 147
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 151
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public dataForKey(Ljava/lang/String;)[B
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 311
    iget-object v1, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    move-object v0, v1

    check-cast v0, [B

    .line 313
    .local v0, "data":[B
    if-nez v0, :cond_0

    .line 315
    iget-object v1, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->service:Ljava/lang/String;

    iget-object v2, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->accessGroup:Ljava/lang/String;

    invoke-static {p1, v1, v2}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->dataForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 318
    :cond_0
    return-object v0
.end method

.method public description()Ljava/lang/String;
    .locals 11

    .prologue
    .line 453
    iget-object v8, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->service:Ljava/lang/String;

    iget-object v9, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->accessGroup:Ljava/lang/String;

    invoke-static {v8, v9}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsForServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    .line 454
    .local v4, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 456
    .local v5, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 458
    .local v0, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 460
    .local v1, "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v8, "Service"

    const-string v10, "kSecAttrService"

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v1, v8, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 461
    const-string v8, "Account"

    const-string v10, "kSecAttrAccount"

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v1, v8, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    const-string v8, "AccessGroup"

    const-string v10, "kSecAttrAccessGroup"

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v1, v8, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    const-string v8, "kSecValueData"

    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    move-object v2, v8

    check-cast v2, [B

    .line 465
    .local v2, "data":[B
    const/4 v6, 0x0

    .line 469
    .local v6, "string":Ljava/lang/String;
    :try_start_0
    new-instance v7, Ljava/lang/String;

    const-string v8, "UTF-8"

    invoke-direct {v7, v2, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v6    # "string":Ljava/lang/String;
    .local v7, "string":Ljava/lang/String;
    move-object v6, v7

    .line 476
    .end local v7    # "string":Ljava/lang/String;
    .restart local v6    # "string":Ljava/lang/String;
    :goto_1
    if-eqz v6, :cond_0

    .line 478
    const-string v8, "Value"

    invoke-virtual {v1, v8, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    :goto_2
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 471
    :catch_0
    move-exception v3

    .line 473
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v3}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1

    .line 482
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_0
    const-string v8, "Value"

    invoke-virtual {v1, v8, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 488
    .end local v0    # "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "data":[B
    .end local v6    # "string":Ljava/lang/String;
    :cond_1
    invoke-virtual {v5}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method public init()Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;
    .locals 3

    .prologue
    .line 90
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    sget-object v1, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->initWithServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;)Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    move-result-object v0

    return-object v0
.end method

.method public initWithService(Ljava/lang/String;)Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;
    .locals 2
    .param p1, "service"    # Ljava/lang/String;

    .prologue
    .line 95
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->initWithServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;)Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    move-result-object v0

    return-object v0
.end method

.method public initWithServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;)Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;
    .locals 1
    .param p1, "aService"    # Ljava/lang/String;
    .param p2, "aAccessGroup"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->service:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 102
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->defaultService:Ljava/lang/String;

    iput-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->service:Ljava/lang/String;

    .line 105
    :cond_0
    iput-object p1, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->service:Ljava/lang/String;

    .line 106
    iput-object p2, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->accessGroup:Ljava/lang/String;

    .line 108
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 110
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    .line 117
    :goto_0
    sget-object v0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->instance:Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;

    return-object v0

    .line 114
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    goto :goto_0
.end method

.method public removeAllItemsForKey(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 422
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 424
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    :goto_0
    return-void

    .line 428
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->service:Ljava/lang/String;

    iget-object v1, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->accessGroup:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->removeItemForKeyServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0
.end method

.method public removeAllServiceAccessGroupItems()V
    .locals 2

    .prologue
    .line 434
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 435
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->service:Ljava/lang/String;

    iget-object v1, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->accessGroup:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->removeAllItemsForServiceAccessGroup(Ljava/lang/String;Ljava/lang/String;)Z

    .line 436
    return-void
.end method

.method public setAccessGroup(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->accessGroup:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public setDataForKey([BLjava/lang/String;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 294
    if-eqz p2, :cond_0

    .line 307
    :goto_0
    return-void

    .line 299
    :cond_0
    if-nez p1, :cond_1

    .line 301
    invoke-static {p2}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->removeItemForKey(Ljava/lang/String;)Z

    goto :goto_0

    .line 305
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    invoke-virtual {v0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public setService(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->service:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public setStringForKey(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 263
    :try_start_0
    const-string v2, "UTF-8"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 265
    .local v0, "data":[B
    invoke-virtual {p0, v0, p2}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setDataForKey([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 271
    .end local v0    # "data":[B
    :goto_0
    return-void

    .line 267
    :catch_0
    move-exception v1

    .line 269
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method public stringForKey(Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 275
    check-cast p1, Ljava/lang/String;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->dataForKey(Ljava/lang/String;)[B

    move-result-object v0

    .line 277
    .local v0, "data":[B
    if-eqz v0, :cond_0

    .line 281
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    :goto_0
    return-object v2

    .line 283
    :catch_0
    move-exception v1

    .line 285
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 289
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public synchronize()V
    .locals 7

    .prologue
    .line 440
    iget-object v3, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 441
    .local v2, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 443
    .local v1, "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 445
    .local v0, "key":Ljava/lang/String;
    iget-object v4, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->service:Ljava/lang/String;

    iget-object v6, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->accessGroup:Ljava/lang/String;

    invoke-static {v4, v0, v5, v6}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setDataForKeyServiceAccessGroup(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 448
    .end local v0    # "key":Ljava/lang/String;
    :cond_0
    iget-object v3, p0, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->itemsToUpdate:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    .line 449
    return-void
.end method
