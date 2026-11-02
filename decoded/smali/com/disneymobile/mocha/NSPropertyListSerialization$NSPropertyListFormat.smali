.class public final enum Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;
.super Ljava/lang/Enum;
.source "NSPropertyListSerialization.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSPropertyListSerialization;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NSPropertyListFormat"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

.field public static final enum BinaryFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

.field public static final enum OpenStepFormat:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

.field public static final enum XMLFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 45
    new-instance v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    const-string v1, "OpenStepFormat"

    invoke-direct {v0, v1, v2}, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->OpenStepFormat:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    .line 46
    new-instance v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    const-string v1, "XMLFormat_v1_0"

    invoke-direct {v0, v1, v3}, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->XMLFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    .line 47
    new-instance v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    const-string v1, "BinaryFormat_v1_0"

    invoke-direct {v0, v1, v4}, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->BinaryFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    .line 44
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    sget-object v1, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->OpenStepFormat:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    aput-object v1, v0, v2

    sget-object v1, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->XMLFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    aput-object v1, v0, v3

    sget-object v1, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->BinaryFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    aput-object v1, v0, v4

    sput-object v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->$VALUES:[Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

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
    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 44
    const-class v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    return-object v0
.end method

.method public static values()[Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;
    .locals 1

    .prologue
    .line 44
    sget-object v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->$VALUES:[Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    invoke-virtual {v0}, [Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    return-object v0
.end method
