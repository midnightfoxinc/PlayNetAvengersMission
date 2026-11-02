.class public Lcom/disneymobile/mocha/NSDate;
.super Lcom/disneymobile/mocha/NSObject;
.source "NSDate.java"


# static fields
.field public static NSTimeIntervalSince1970:D


# instance fields
.field private contents:D


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 7
    const-wide v0, 0x41cd27e440000000L    # 9.783072E8

    sput-wide v0, Lcom/disneymobile/mocha/NSDate;->NSTimeIntervalSince1970:D

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 40
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSDate;->init()Lcom/disneymobile/mocha/NSDate;

    .line 41
    return-void
.end method

.method public static date()Lcom/disneymobile/mocha/NSDate;
    .locals 1

    .prologue
    .line 10
    new-instance v0, Lcom/disneymobile/mocha/NSDate;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSDate;-><init>()V

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSDate;->init()Lcom/disneymobile/mocha/NSDate;

    move-result-object v0

    return-object v0
.end method

.method public static dateWithDate(Lcom/disneymobile/mocha/NSDate;)Lcom/disneymobile/mocha/NSDate;
    .locals 1
    .param p0, "date"    # Lcom/disneymobile/mocha/NSDate;

    .prologue
    .line 14
    new-instance v0, Lcom/disneymobile/mocha/NSDate;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSDate;-><init>()V

    invoke-direct {v0, p0}, Lcom/disneymobile/mocha/NSDate;->init(Lcom/disneymobile/mocha/NSDate;)Lcom/disneymobile/mocha/NSDate;

    move-result-object v0

    return-object v0
.end method

.method public static distantPast()Lcom/disneymobile/mocha/NSDate;
    .locals 2

    .prologue
    .line 18
    new-instance v0, Lcom/disneymobile/mocha/NSDate;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSDate;-><init>()V

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/disneymobile/mocha/NSDate;->initWithTimeIntervalSinceReferenceDate(F)Lcom/disneymobile/mocha/NSDate;

    move-result-object v0

    return-object v0
.end method

.method private init()Lcom/disneymobile/mocha/NSDate;
    .locals 6

    .prologue
    .line 44
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    .line 45
    .local v0, "timeMS":J
    long-to-double v2, v0

    const-wide v4, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v4

    sget-wide v4, Lcom/disneymobile/mocha/NSDate;->NSTimeIntervalSince1970:D

    sub-double/2addr v2, v4

    iput-wide v2, p0, Lcom/disneymobile/mocha/NSDate;->contents:D

    .line 46
    return-object p0
.end method

.method private init(Lcom/disneymobile/mocha/NSDate;)Lcom/disneymobile/mocha/NSDate;
    .locals 2
    .param p1, "date"    # Lcom/disneymobile/mocha/NSDate;

    .prologue
    .line 50
    iget-wide v0, p1, Lcom/disneymobile/mocha/NSDate;->contents:D

    iput-wide v0, p0, Lcom/disneymobile/mocha/NSDate;->contents:D

    .line 51
    return-object p0
.end method

.method private initWithTimeIntervalSinceDate(FLcom/disneymobile/mocha/NSDate;)Lcom/disneymobile/mocha/NSDate;
    .locals 4
    .param p1, "seconds"    # F
    .param p2, "refDate"    # Lcom/disneymobile/mocha/NSDate;

    .prologue
    .line 55
    iget-wide v0, p2, Lcom/disneymobile/mocha/NSDate;->contents:D

    float-to-double v2, p1

    add-double/2addr v0, v2

    iput-wide v0, p0, Lcom/disneymobile/mocha/NSDate;->contents:D

    .line 56
    return-object p0
.end method

.method private initWithTimeIntervalSinceReferenceDate(F)Lcom/disneymobile/mocha/NSDate;
    .locals 2
    .param p1, "seconds"    # F

    .prologue
    .line 60
    float-to-double v0, p1

    iput-wide v0, p0, Lcom/disneymobile/mocha/NSDate;->contents:D

    .line 61
    return-object p0
.end method


# virtual methods
.method public dateByAddingTimeInterval(F)Lcom/disneymobile/mocha/NSDate;
    .locals 1
    .param p1, "seconds"    # F

    .prologue
    .line 22
    new-instance v0, Lcom/disneymobile/mocha/NSDate;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSDate;-><init>()V

    invoke-direct {v0, p1, p0}, Lcom/disneymobile/mocha/NSDate;->initWithTimeIntervalSinceDate(FLcom/disneymobile/mocha/NSDate;)Lcom/disneymobile/mocha/NSDate;

    move-result-object v0

    return-object v0
.end method

.method public description()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSDate;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final interval()D
    .locals 2

    .prologue
    .line 26
    iget-wide v0, p0, Lcom/disneymobile/mocha/NSDate;->contents:D

    return-wide v0
.end method

.method public isEqualToDate(Lcom/disneymobile/mocha/NSDate;)Z
    .locals 4
    .param p1, "anotherDate"    # Lcom/disneymobile/mocha/NSDate;

    .prologue
    .line 34
    iget-wide v0, p1, Lcom/disneymobile/mocha/NSDate;->contents:D

    iget-wide v2, p0, Lcom/disneymobile/mocha/NSDate;->contents:D

    cmpl-double v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public timeIntervalSinceNow()D
    .locals 4

    .prologue
    .line 30
    iget-wide v0, p0, Lcom/disneymobile/mocha/NSDate;->contents:D

    invoke-static {}, Lcom/disneymobile/mocha/NSDate;->date()Lcom/disneymobile/mocha/NSDate;

    move-result-object v2

    iget-wide v2, v2, Lcom/disneymobile/mocha/NSDate;->contents:D

    sub-double/2addr v0, v2

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/disneymobile/mocha/NSDate;->contents:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
