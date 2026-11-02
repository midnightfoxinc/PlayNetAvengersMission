.class public final enum Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;
.super Ljava/lang/Enum;
.source "NSURLRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSURLRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CachePolicy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

.field public static final enum NSURLRequestReturnCacheDataElseLoad:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

.field public static final enum NSURLRequestUseProtocolCachePolicy:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

.field public static final enum ReloadIgnoringCacheData:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

.field public static final enum ReloadIgnoringLocalAndRemoteCacheData:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 16
    new-instance v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    const-string v1, "ReloadIgnoringLocalAndRemoteCacheData"

    invoke-direct {v0, v1, v2}, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->ReloadIgnoringLocalAndRemoteCacheData:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    .line 17
    new-instance v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    const-string v1, "ReloadIgnoringCacheData"

    invoke-direct {v0, v1, v3}, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->ReloadIgnoringCacheData:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    .line 18
    new-instance v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    const-string v1, "NSURLRequestUseProtocolCachePolicy"

    invoke-direct {v0, v1, v4}, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->NSURLRequestUseProtocolCachePolicy:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    .line 19
    new-instance v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    const-string v1, "NSURLRequestReturnCacheDataElseLoad"

    invoke-direct {v0, v1, v5}, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->NSURLRequestReturnCacheDataElseLoad:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    .line 15
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    sget-object v1, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->ReloadIgnoringLocalAndRemoteCacheData:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    aput-object v1, v0, v2

    sget-object v1, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->ReloadIgnoringCacheData:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    aput-object v1, v0, v3

    sget-object v1, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->NSURLRequestUseProtocolCachePolicy:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    aput-object v1, v0, v4

    sget-object v1, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->NSURLRequestReturnCacheDataElseLoad:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    aput-object v1, v0, v5

    sput-object v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->$VALUES:[Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 15
    const-class v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    return-object v0
.end method

.method public static values()[Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->$VALUES:[Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    invoke-virtual {v0}, [Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    return-object v0
.end method
