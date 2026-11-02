.class public Lcom/disney/id/android/DIDEntitlements;
.super Ljava/lang/Object;
.source "DIDEntitlements.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;
    }
.end annotation


# instance fields
.field private final entitlementList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;",
            ">;"
        }
    .end annotation
.end field

.field private final entitlements:Lorg/json/JSONArray;


# direct methods
.method protected constructor <init>(Lorg/json/JSONArray;)V
    .locals 5
    .param p1, "data"    # Lorg/json/JSONArray;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/disney/id/android/DIDEntitlements;->entitlementList:Ljava/util/List;

    .line 19
    iput-object p1, p0, Lcom/disney/id/android/DIDEntitlements;->entitlements:Lorg/json/JSONArray;

    .line 20
    iget-object v2, p0, Lcom/disney/id/android/DIDEntitlements;->entitlements:Lorg/json/JSONArray;

    invoke-static {v2}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Lorg/json/JSONArray;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 21
    iget-object v2, p0, Lcom/disney/id/android/DIDEntitlements;->entitlements:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v1

    .line 22
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 24
    :try_start_0
    iget-object v2, p0, Lcom/disney/id/android/DIDEntitlements;->entitlements:Lorg/json/JSONArray;

    new-instance v3, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;

    iget-object v4, p0, Lcom/disney/id/android/DIDEntitlements;->entitlements:Lorg/json/JSONArray;

    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;-><init>(Lcom/disney/id/android/DIDEntitlements;Lorg/json/JSONObject;)V

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 28
    .end local v0    # "i":I
    .end local v1    # "length":I
    :cond_0
    return-void

    .line 25
    .restart local v0    # "i":I
    .restart local v1    # "length":I
    :catch_0
    move-exception v2

    goto :goto_1
.end method


# virtual methods
.method public getEntitlements()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements;->entitlementList:Ljava/util/List;

    return-object v0
.end method

.method public hasEntitlements()Z
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements;->entitlements:Lorg/json/JSONArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements;->entitlementList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements;->entitlementList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
