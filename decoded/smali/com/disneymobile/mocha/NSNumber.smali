.class public Lcom/disneymobile/mocha/NSNumber;
.super Lcom/disneymobile/mocha/NSObject;
.source "NSNumber.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/mocha/NSNumber$1;,
        Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;
    }
.end annotation


# instance fields
.field private contents:Ljava/lang/Double;

.field public datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 24
    sget-object v0, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Double:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 25
    const-wide/16 v0, 0x0

    invoke-direct {p0, v0, v1}, Lcom/disneymobile/mocha/NSNumber;->init(D)Lcom/disneymobile/mocha/NSNumber;

    .line 26
    return-void
.end method

.method public constructor <init>(C)V
    .locals 0
    .param p1, "value"    # C

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 35
    invoke-virtual {p0, p1}, Lcom/disneymobile/mocha/NSNumber;->initWithChar(C)Lcom/disneymobile/mocha/NSNumber;

    .line 36
    return-void
.end method

.method public constructor <init>(D)V
    .locals 1
    .param p1, "value"    # D

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/disneymobile/mocha/NSNumber;->initWithDouble(D)Lcom/disneymobile/mocha/NSNumber;

    .line 41
    return-void
.end method

.method public constructor <init>(F)V
    .locals 0
    .param p1, "value"    # F

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 45
    invoke-virtual {p0, p1}, Lcom/disneymobile/mocha/NSNumber;->initWithFloat(F)Lcom/disneymobile/mocha/NSNumber;

    .line 46
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 50
    invoke-virtual {p0, p1}, Lcom/disneymobile/mocha/NSNumber;->initWithInt(I)Lcom/disneymobile/mocha/NSNumber;

    .line 51
    return-void
.end method

.method public constructor <init>(J)V
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 55
    invoke-virtual {p0, p1, p2}, Lcom/disneymobile/mocha/NSNumber;->initWithLong(J)Lcom/disneymobile/mocha/NSNumber;

    .line 56
    return-void
.end method

.method public constructor <init>(S)V
    .locals 0
    .param p1, "value"    # S

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 60
    invoke-virtual {p0, p1}, Lcom/disneymobile/mocha/NSNumber;->initWithShort(S)Lcom/disneymobile/mocha/NSNumber;

    .line 61
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 30
    invoke-virtual {p0, p1}, Lcom/disneymobile/mocha/NSNumber;->initWithBool(Z)Lcom/disneymobile/mocha/NSNumber;

    .line 31
    return-void
.end method

.method private init(D)Lcom/disneymobile/mocha/NSNumber;
    .locals 1
    .param p1, "value"    # D

    .prologue
    .line 307
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->contents:Ljava/lang/Double;

    .line 308
    return-object p0
.end method

.method private static number(D)Lcom/disneymobile/mocha/NSNumber;
    .locals 2
    .param p0, "value"    # D

    .prologue
    .line 303
    new-instance v0, Lcom/disneymobile/mocha/NSNumber;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSNumber;-><init>()V

    invoke-direct {v0, p0, p1}, Lcom/disneymobile/mocha/NSNumber;->init(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    return-object v0
.end method

.method public static numberWithBool(Z)Lcom/disneymobile/mocha/NSNumber;
    .locals 4
    .param p0, "flag"    # Z

    .prologue
    .line 65
    if-nez p0, :cond_0

    const-wide/16 v2, 0x0

    .line 66
    .local v2, "value":D
    :goto_0
    invoke-static {v2, v3}, Lcom/disneymobile/mocha/NSNumber;->number(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    .line 67
    .local v0, "number":Lcom/disneymobile/mocha/NSNumber;
    sget-object v1, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Boolean:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v1, v0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 68
    return-object v0

    .line 65
    .end local v0    # "number":Lcom/disneymobile/mocha/NSNumber;
    .end local v2    # "value":D
    :cond_0
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    goto :goto_0
.end method

.method public static numberWithChar(C)Lcom/disneymobile/mocha/NSNumber;
    .locals 4
    .param p0, "value"    # C

    .prologue
    .line 73
    int-to-double v2, p0

    invoke-static {v2, v3}, Lcom/disneymobile/mocha/NSNumber;->number(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    .line 74
    .local v0, "number":Lcom/disneymobile/mocha/NSNumber;
    sget-object v1, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Char:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v1, v0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 75
    return-object v0
.end method

.method public static numberWithDouble(D)Lcom/disneymobile/mocha/NSNumber;
    .locals 2
    .param p0, "value"    # D

    .prologue
    .line 80
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSNumber;->number(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    .line 81
    .local v0, "number":Lcom/disneymobile/mocha/NSNumber;
    sget-object v1, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Double:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v1, v0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 82
    return-object v0
.end method

.method public static numberWithFloat(F)Lcom/disneymobile/mocha/NSNumber;
    .locals 4
    .param p0, "value"    # F

    .prologue
    .line 87
    float-to-double v2, p0

    invoke-static {v2, v3}, Lcom/disneymobile/mocha/NSNumber;->number(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    .line 88
    .local v0, "number":Lcom/disneymobile/mocha/NSNumber;
    sget-object v1, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Float:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v1, v0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 89
    return-object v0
.end method

.method public static numberWithInt(I)Lcom/disneymobile/mocha/NSNumber;
    .locals 4
    .param p0, "value"    # I

    .prologue
    .line 94
    int-to-double v2, p0

    invoke-static {v2, v3}, Lcom/disneymobile/mocha/NSNumber;->number(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    .line 95
    .local v0, "number":Lcom/disneymobile/mocha/NSNumber;
    sget-object v1, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Integer:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v1, v0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 96
    return-object v0
.end method

.method public static numberWithInteger(I)Lcom/disneymobile/mocha/NSNumber;
    .locals 4
    .param p0, "value"    # I

    .prologue
    .line 101
    int-to-double v2, p0

    invoke-static {v2, v3}, Lcom/disneymobile/mocha/NSNumber;->number(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    .line 102
    .local v0, "number":Lcom/disneymobile/mocha/NSNumber;
    sget-object v1, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Integer:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v1, v0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 103
    return-object v0
.end method

.method public static numberWithLong(J)Lcom/disneymobile/mocha/NSNumber;
    .locals 4
    .param p0, "value"    # J

    .prologue
    .line 108
    long-to-double v2, p0

    invoke-static {v2, v3}, Lcom/disneymobile/mocha/NSNumber;->number(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    .line 109
    .local v0, "number":Lcom/disneymobile/mocha/NSNumber;
    sget-object v1, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Long:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v1, v0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 110
    return-object v0
.end method

.method public static numberWithShort(S)Lcom/disneymobile/mocha/NSNumber;
    .locals 4
    .param p0, "value"    # S

    .prologue
    .line 115
    int-to-double v2, p0

    invoke-static {v2, v3}, Lcom/disneymobile/mocha/NSNumber;->number(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    .line 116
    .local v0, "number":Lcom/disneymobile/mocha/NSNumber;
    sget-object v1, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Short:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v1, v0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 117
    return-object v0
.end method


# virtual methods
.method public boolValue()Z
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->contents:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public charValue()C
    .locals 2

    .prologue
    .line 186
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->contents:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    double-to-int v0, v0

    int-to-char v0, v0

    return v0
.end method

.method public compare(Lcom/disneymobile/mocha/NSNumber;)Lcom/disneymobile/mocha/NSComparisonResult;
    .locals 6
    .param p1, "aNumber"    # Lcom/disneymobile/mocha/NSNumber;

    .prologue
    .line 235
    iget-object v2, p0, Lcom/disneymobile/mocha/NSNumber;->contents:Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {p1}, Lcom/disneymobile/mocha/NSNumber;->doubleValue()D

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    .line 238
    .local v0, "comparison":I
    sget-object v1, Lcom/disneymobile/mocha/NSComparisonResult;->NSOrderedSame:Lcom/disneymobile/mocha/NSComparisonResult;

    .line 241
    .local v1, "comparisonResult":Lcom/disneymobile/mocha/NSComparisonResult;
    if-gez v0, :cond_1

    .line 242
    sget-object v1, Lcom/disneymobile/mocha/NSComparisonResult;->NSOrderedDescending:Lcom/disneymobile/mocha/NSComparisonResult;

    .line 247
    :cond_0
    :goto_0
    return-object v1

    .line 243
    :cond_1
    if-lez v0, :cond_0

    .line 244
    sget-object v1, Lcom/disneymobile/mocha/NSComparisonResult;->NSOrderedAscending:Lcom/disneymobile/mocha/NSComparisonResult;

    goto :goto_0
.end method

.method public description()Ljava/lang/String;
    .locals 1

    .prologue
    .line 294
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSNumber;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public doubleValue()D
    .locals 2

    .prologue
    .line 191
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->contents:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public floatValue()F
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->contents:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    move-result v0

    return v0
.end method

.method public initWithBool(Z)Lcom/disneymobile/mocha/NSNumber;
    .locals 3
    .param p1, "flag"    # Z

    .prologue
    .line 126
    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    .line 127
    .local v0, "value":D
    :goto_0
    sget-object v2, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Boolean:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v2, p0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 128
    invoke-direct {p0, v0, v1}, Lcom/disneymobile/mocha/NSNumber;->init(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v2

    return-object v2

    .line 126
    .end local v0    # "value":D
    :cond_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    goto :goto_0
.end method

.method public initWithChar(C)Lcom/disneymobile/mocha/NSNumber;
    .locals 4
    .param p1, "character"    # C

    .prologue
    .line 133
    invoke-static {p1}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "charString":Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    .line 135
    .local v2, "value":D
    sget-object v1, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Char:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v1, p0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 136
    invoke-direct {p0, v2, v3}, Lcom/disneymobile/mocha/NSNumber;->init(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v1

    return-object v1
.end method

.method public initWithDouble(D)Lcom/disneymobile/mocha/NSNumber;
    .locals 1
    .param p1, "value"    # D

    .prologue
    .line 141
    sget-object v0, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Double:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 142
    invoke-direct {p0, p1, p2}, Lcom/disneymobile/mocha/NSNumber;->init(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    return-object v0
.end method

.method public initWithFloat(F)Lcom/disneymobile/mocha/NSNumber;
    .locals 2
    .param p1, "value"    # F

    .prologue
    .line 147
    sget-object v0, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Float:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 148
    float-to-double v0, p1

    invoke-direct {p0, v0, v1}, Lcom/disneymobile/mocha/NSNumber;->init(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    return-object v0
.end method

.method public initWithInt(I)Lcom/disneymobile/mocha/NSNumber;
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 153
    sget-object v0, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Integer:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 154
    int-to-double v0, p1

    invoke-direct {p0, v0, v1}, Lcom/disneymobile/mocha/NSNumber;->init(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    return-object v0
.end method

.method public initWithInteger(I)Lcom/disneymobile/mocha/NSNumber;
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 159
    sget-object v0, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Integer:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 160
    int-to-double v0, p1

    invoke-direct {p0, v0, v1}, Lcom/disneymobile/mocha/NSNumber;->init(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    return-object v0
.end method

.method public initWithLong(J)Lcom/disneymobile/mocha/NSNumber;
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 165
    sget-object v0, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Long:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 166
    long-to-double v0, p1

    invoke-direct {p0, v0, v1}, Lcom/disneymobile/mocha/NSNumber;->init(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    return-object v0
.end method

.method public initWithShort(S)Lcom/disneymobile/mocha/NSNumber;
    .locals 2
    .param p1, "value"    # S

    .prologue
    .line 171
    sget-object v0, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Short:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    iput-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 172
    int-to-double v0, p1

    invoke-direct {p0, v0, v1}, Lcom/disneymobile/mocha/NSNumber;->init(D)Lcom/disneymobile/mocha/NSNumber;

    move-result-object v0

    return-object v0
.end method

.method public intValue()I
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->contents:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->intValue()I

    move-result v0

    return v0
.end method

.method public integerValue()I
    .locals 1

    .prologue
    .line 206
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSNumber;->intValue()I

    move-result v0

    return v0
.end method

.method public isEqualToNumber(Lcom/disneymobile/mocha/NSNumber;)Z
    .locals 4
    .param p1, "aNumber"    # Lcom/disneymobile/mocha/NSNumber;

    .prologue
    .line 252
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->contents:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p1}, Lcom/disneymobile/mocha/NSNumber;->doubleValue()D

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public longValue()J
    .locals 2

    .prologue
    .line 211
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->contents:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public shortValue()S
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNumber;->contents:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->shortValue()S

    move-result v0

    return v0
.end method

.method public stringValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 225
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSNumber;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 262
    const-string v0, ""

    .line 264
    .local v0, "value":Ljava/lang/String;
    sget-object v1, Lcom/disneymobile/mocha/NSNumber$1;->$SwitchMap$com$disneymobile$mocha$NSNumber$NSNumberDatatype:[I

    iget-object v2, p0, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    invoke-virtual {v2}, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 289
    :goto_0
    return-object v0

    .line 267
    :pswitch_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSNumber;->intValue()I

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "false"

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 268
    goto :goto_0

    .line 267
    :cond_0
    const-string v1, "true"

    goto :goto_1

    .line 270
    :pswitch_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSNumber;->charValue()C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 271
    goto :goto_0

    .line 273
    :pswitch_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSNumber;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 274
    goto :goto_0

    .line 276
    :pswitch_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSNumber;->floatValue()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 277
    goto :goto_0

    .line 279
    :pswitch_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSNumber;->integerValue()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 280
    goto :goto_0

    .line 282
    :pswitch_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSNumber;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 283
    goto/16 :goto_0

    .line 285
    :pswitch_6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSNumber;->shortValue()S

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 264
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
