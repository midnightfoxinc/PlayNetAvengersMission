.class public final enum Lcom/disneymobile/mocha/NSComparisonResult;
.super Ljava/lang/Enum;
.source "NSComparisonResult.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/disneymobile/mocha/NSComparisonResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/disneymobile/mocha/NSComparisonResult;

.field public static final enum NSOrderedAscending:Lcom/disneymobile/mocha/NSComparisonResult;

.field public static final enum NSOrderedDescending:Lcom/disneymobile/mocha/NSComparisonResult;

.field public static final enum NSOrderedSame:Lcom/disneymobile/mocha/NSComparisonResult;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 5
    new-instance v0, Lcom/disneymobile/mocha/NSComparisonResult;

    const-string v1, "NSOrderedAscending"

    invoke-direct {v0, v1, v2}, Lcom/disneymobile/mocha/NSComparisonResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/NSComparisonResult;->NSOrderedAscending:Lcom/disneymobile/mocha/NSComparisonResult;

    .line 6
    new-instance v0, Lcom/disneymobile/mocha/NSComparisonResult;

    const-string v1, "NSOrderedSame"

    invoke-direct {v0, v1, v3}, Lcom/disneymobile/mocha/NSComparisonResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/NSComparisonResult;->NSOrderedSame:Lcom/disneymobile/mocha/NSComparisonResult;

    .line 7
    new-instance v0, Lcom/disneymobile/mocha/NSComparisonResult;

    const-string v1, "NSOrderedDescending"

    invoke-direct {v0, v1, v4}, Lcom/disneymobile/mocha/NSComparisonResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/NSComparisonResult;->NSOrderedDescending:Lcom/disneymobile/mocha/NSComparisonResult;

    .line 3
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/disneymobile/mocha/NSComparisonResult;

    sget-object v1, Lcom/disneymobile/mocha/NSComparisonResult;->NSOrderedAscending:Lcom/disneymobile/mocha/NSComparisonResult;

    aput-object v1, v0, v2

    sget-object v1, Lcom/disneymobile/mocha/NSComparisonResult;->NSOrderedSame:Lcom/disneymobile/mocha/NSComparisonResult;

    aput-object v1, v0, v3

    sget-object v1, Lcom/disneymobile/mocha/NSComparisonResult;->NSOrderedDescending:Lcom/disneymobile/mocha/NSComparisonResult;

    aput-object v1, v0, v4

    sput-object v0, Lcom/disneymobile/mocha/NSComparisonResult;->$VALUES:[Lcom/disneymobile/mocha/NSComparisonResult;

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

.method public static valueOf(Ljava/lang/String;)Lcom/disneymobile/mocha/NSComparisonResult;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lcom/disneymobile/mocha/NSComparisonResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSComparisonResult;

    return-object v0
.end method

.method public static values()[Lcom/disneymobile/mocha/NSComparisonResult;
    .locals 1

    .prologue
    .line 3
    sget-object v0, Lcom/disneymobile/mocha/NSComparisonResult;->$VALUES:[Lcom/disneymobile/mocha/NSComparisonResult;

    invoke-virtual {v0}, [Lcom/disneymobile/mocha/NSComparisonResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/disneymobile/mocha/NSComparisonResult;

    return-object v0
.end method
