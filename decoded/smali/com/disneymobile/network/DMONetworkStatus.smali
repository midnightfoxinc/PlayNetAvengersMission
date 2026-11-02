.class public final enum Lcom/disneymobile/network/DMONetworkStatus;
.super Ljava/lang/Enum;
.source "DMONetworkStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/disneymobile/network/DMONetworkStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/disneymobile/network/DMONetworkStatus;

.field public static final enum NotReachable:Lcom/disneymobile/network/DMONetworkStatus;

.field public static final enum ViaCarrier:Lcom/disneymobile/network/DMONetworkStatus;

.field public static final enum ViaWifi:Lcom/disneymobile/network/DMONetworkStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 5
    new-instance v0, Lcom/disneymobile/network/DMONetworkStatus;

    const-string v1, "NotReachable"

    invoke-direct {v0, v1, v2}, Lcom/disneymobile/network/DMONetworkStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/network/DMONetworkStatus;->NotReachable:Lcom/disneymobile/network/DMONetworkStatus;

    .line 6
    new-instance v0, Lcom/disneymobile/network/DMONetworkStatus;

    const-string v1, "ViaCarrier"

    invoke-direct {v0, v1, v3}, Lcom/disneymobile/network/DMONetworkStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/network/DMONetworkStatus;->ViaCarrier:Lcom/disneymobile/network/DMONetworkStatus;

    .line 7
    new-instance v0, Lcom/disneymobile/network/DMONetworkStatus;

    const-string v1, "ViaWifi"

    invoke-direct {v0, v1, v4}, Lcom/disneymobile/network/DMONetworkStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/network/DMONetworkStatus;->ViaWifi:Lcom/disneymobile/network/DMONetworkStatus;

    .line 3
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/disneymobile/network/DMONetworkStatus;

    sget-object v1, Lcom/disneymobile/network/DMONetworkStatus;->NotReachable:Lcom/disneymobile/network/DMONetworkStatus;

    aput-object v1, v0, v2

    sget-object v1, Lcom/disneymobile/network/DMONetworkStatus;->ViaCarrier:Lcom/disneymobile/network/DMONetworkStatus;

    aput-object v1, v0, v3

    sget-object v1, Lcom/disneymobile/network/DMONetworkStatus;->ViaWifi:Lcom/disneymobile/network/DMONetworkStatus;

    aput-object v1, v0, v4

    sput-object v0, Lcom/disneymobile/network/DMONetworkStatus;->$VALUES:[Lcom/disneymobile/network/DMONetworkStatus;

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
    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/disneymobile/network/DMONetworkStatus;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lcom/disneymobile/network/DMONetworkStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/network/DMONetworkStatus;

    return-object v0
.end method

.method public static values()[Lcom/disneymobile/network/DMONetworkStatus;
    .locals 1

    .prologue
    .line 3
    sget-object v0, Lcom/disneymobile/network/DMONetworkStatus;->$VALUES:[Lcom/disneymobile/network/DMONetworkStatus;

    invoke-virtual {v0}, [Lcom/disneymobile/network/DMONetworkStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/disneymobile/network/DMONetworkStatus;

    return-object v0
.end method
